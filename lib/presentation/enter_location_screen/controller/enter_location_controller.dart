import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uptm_secure_stay/presentation/expore_page/models/locationgrid_item_model.dart';

class EnterLocationController extends GetxController {
  RxBool isTap = false.obs;
  RxBool isSubmit = false.obs;
  TextEditingController searchController = TextEditingController();
  RxList<LocationIdItemModel> accommodationsList = <LocationIdItemModel>[].obs;
  RxBool isLoading = true.obs;
  Position? currentPosition;
  GoogleMapController? mapController;

  // UPTM Campus Cheras coordinates
  final LatLng uptmCampusLocation = LatLng(3.1280, 101.7374);

  // Your Google Maps API Key
  final String apiKey =
      'AIzaSyDgeQ6GRGUXyiAvFIzOjYfDLDVEl4lsQUY'; // Replace with your key

  Future<void> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
          'Error', 'Location services are disabled. Please enable them.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error', 'Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error', 'Location permissions are permanently denied');
      return;
    }

    try {
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      fetchAccommodations();
    } catch (e) {
      Get.snackbar('Error', 'Failed to get location: $e');
    }
  }

  void searchAccommodations(String query) {
    if (query.isEmpty) {
      // Reset to show all accommodations
      fetchAccommodations(); // This should fetch all accommodations from Firebase
      return;
    }

    // Filter accommodations based on the query
    var filteredList = accommodationsList
        .where((item) =>
            item.name.toLowerCase().contains(query.toLowerCase()) ||
            item.address.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // Update the list with the filtered results
    accommodationsList.assignAll(filteredList);

    // If there are results, set the map to focus on them
    if (filteredList.isNotEmpty) {
      _zoomToAccommodation(filteredList.first);
    }
  }

// Function to set mapController
  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  void _zoomToAccommodation(LocationIdItemModel accommodation) {
    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(accommodation.latitude, accommodation.longitude),
          16, // Adjust zoom level as needed
        ),
      );
    }
  }

  // Fetch accommodations from Firebase and use Google Maps API for geocoding
  void fetchAccommodations() async {
    try {
      isLoading.value = true;

      // Use a Set to store unique accommodations by their title or another unique property
      Set<LocationIdItemModel> uniqueAccommodationsSet = {};

      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('accommodations').get();

      // Clear the list only once to avoid duplication
      accommodationsList.clear();

      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        String address = data['address'] ?? '';
        String imageUrl = data['image_url'] ?? '';
        String title = data['title'] ?? 'No Title';
        double monthlyRent = data['monthly_rent'] != null
            ? data['monthly_rent'].toDouble()
            : 0.0;
        int beds = data['beds'] ?? 0;
        int baths = data['baths'] ?? 0;
        int sqft = data['sqft'] ?? 0;

        double? lat;
        double? lng;
        double distance = 0.0;

        try {
          // Use Google Maps API to get coordinates for the address
          String url =
              'https://maps.googleapis.com/maps/api/geocode/json?address=${Uri.encodeComponent(address)}&key=$apiKey';
          http.Response response = await http.get(Uri.parse(url));
          if (response.statusCode == 200) {
            var jsonData = jsonDecode(response.body);
            if (jsonData['status'] == 'OK') {
              lat = jsonData['results'][0]['geometry']['location']['lat'];
              lng = jsonData['results'][0]['geometry']['location']['lng'];

              if (lat != null && lng != null && currentPosition != null) {
                distance = Geolocator.distanceBetween(
                  currentPosition!.latitude,
                  currentPosition!.longitude,
                  lat,
                  lng,
                );
              }
            } else {
              print(
                  "Geocoding failed for address: $address. Status: ${jsonData['status']}");
            }
          } else {
            print(
                "Failed to fetch geocoding data. Status code: ${response.statusCode}");
          }
        } catch (e) {
          print("Error during geocoding for address: $address. Error: $e");
        }

        // Check if lat and lng are valid before adding to the set
        if (lat != null && lng != null) {
          uniqueAccommodationsSet.add(LocationIdItemModel(
            id: doc.id,
            image: imageUrl,
            name: title,
            address: address, // Pass address here
            price: '\RM$monthlyRent',
            type: '/mo',
            bed: '$beds',
            bathtub: '$baths',
            sqft: '$sqft sqft',
            isFavourite: false,
            latitude: lat,
            longitude: lng,
            distance: distance,
          ));
        } else {
          print("Skipping accommodation due to missing coordinates: $title");
        }
      }

      // Convert the set back to a list and update the accommodationsList
      accommodationsList.assignAll(uniqueAccommodationsSet.toList());

      print("Number of accommodations fetched: ${accommodationsList.length}");
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to fetch accommodations: $e');
    }
  }
}
