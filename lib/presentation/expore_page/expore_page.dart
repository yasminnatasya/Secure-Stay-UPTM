import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:uptm_secure_stay/presentation/enter_location_screen/controller/enter_location_controller.dart';
import 'package:uptm_secure_stay/presentation/home_screen_container_screen/controller/home_screen_container_controller.dart';
import 'package:uptm_secure_stay/presentation/property_details_screen/property_details_screen.dart';
import 'package:uptm_secure_stay/widgets/custom_search_view.dart';

class ExporePage extends StatefulWidget {
  const ExporePage({super.key});

  @override
  State<ExporePage> createState() => _ExporePageState();
}

class _ExporePageState extends State<ExporePage> {
  EnterLocationController enterLocationController =
      Get.put(EnterLocationController());
  late GoogleMapController _mapController;
  LatLng _initialPosition = const LatLng(3.1280, 101.7374);
  Set<Marker> _markers = {};
  final Location _locationService = Location();

  @override
  void initState() {
    super.initState();
    _checkLocationPermissionAndService();
    _setInitialLocation();

    // Retrieve the search query from HomeScreenContainerController
    final HomeScreenContainerController homeController = Get.find();
    String query = homeController.searchQuery.value;
    if (query.isNotEmpty) {
      enterLocationController.searchController.text = query;
      enterLocationController.searchAccommodations(
          query, _updateMapBounds, _addSearchMarker);
      // Trigger search directly
    }
  }

  Future<void> _checkLocationPermissionAndService() async {
    bool serviceEnabled = await _locationService.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationService.requestService();
      if (!serviceEnabled) {
        _showLocationServiceDialog();
        return;
      } else {
        // Refresh the location after enabling service
        _setInitialLocation();
      }
    }

    PermissionStatus permissionGranted = await _locationService.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationService.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        _showLocationPermissionDialog();
      } else {
        // Refresh the location after granting permission
        _setInitialLocation();
      }
    } else if (permissionGranted == PermissionStatus.granted) {
      // If permission was already granted, set initial location
      _setInitialLocation();
    }
  }

  void _showLocationServiceDialog() {
    Get.defaultDialog(
      title: "Enable Location Services",
      content: Text(
          "Location services are disabled. Please enable them to use this feature."),
      onConfirm: () async {
        bool enabled = await _locationService.requestService();
        if (enabled) {
          _setInitialLocation(); // Refresh the map immediately if service is enabled
        }
      },
      onCancel: () => Navigator.of(context).pop(),
      textConfirm: "Enable",
      textCancel: "Cancel",
    );
  }

  void _showLocationPermissionDialog() {
    Get.defaultDialog(
      title: "Location Permission Required",
      content: Text("Please grant location permission to access this feature."),
      onConfirm: () async {
        PermissionStatus granted = await _locationService.requestPermission();
        if (granted == PermissionStatus.granted) {
          _setInitialLocation(); // Refresh the map immediately if permission is granted
        }
      },
      onCancel: () => Navigator.of(context).pop(),
      textConfirm: "Allow",
      textCancel: "Deny",
    );
  }

  // Future<BitmapDescriptor> _getCustomMarkerIcon() async {
  //   return await BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration(
  //         size: Size(100, 100)), // Increased size for better visibility
  //     'assets/images/img_ic_home.png', // Path to the home icon in assets
  //   );
  // }

  Future<void> _setInitialLocation() async {
    await enterLocationController.getUserLocation();
    if (enterLocationController.currentPosition != null) {
      _initialPosition = LatLng(
        enterLocationController.currentPosition!.latitude,
        enterLocationController.currentPosition!.longitude,
      );
      _updateMapBounds();
    }
    _addMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Obx(() {
              if (enterLocationController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialPosition,
                  zoom: 14,
                ),
                onMapCreated: (controller) {
                  _mapController = controller;
                  enterLocationController
                      .setMapController(controller); // Pass to the controller
                  _addMarkers();
                  _updateMapBounds();
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: _markers,
              );
            }),
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  Obx(() {
                    enterLocationController.searchController.text =
                        Get.find<HomeScreenContainerController>()
                            .searchQuery
                            .value;
                    return CustomSearchView(
                      onChanged: (p0) {},
                      onSubmit: (query) {
                        enterLocationController.searchAccommodations(
                            query, _updateMapBounds, _addSearchMarker);
                      },
                      controller: enterLocationController.searchController,
                      hintText: "Search...",
                      suffix: Icon(Icons.search, color: Colors.grey),
                    );
                  }),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildAccommodationList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      child: Text(label, style: TextStyle(fontSize: 14)),
    );
  }

  Widget _buildAccommodationList() {
    return Container(
      color: Colors.transparent,
      child: SizedBox(
        height: 150,
        child: Obx(() {
          if (enterLocationController.accommodationsList.isEmpty) {
            return Center(child: Text("No accommodations found."));
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: enterLocationController.accommodationsList.length,
            itemBuilder: (context, index) {
              var item = enterLocationController.accommodationsList[index];
              double distanceInKm =
                  item.distance / 1000; // Convert distance to km

              return GestureDetector(
                onTap: () {
                  // Animate the map camera to the selected accommodation's location
                  _mapController.animateCamera(
                    CameraUpdate.newLatLngZoom(
                      LatLng(item.latitude, item.longitude),
                      16, // Zoom level, adjust as needed
                    ),
                  );

                  // Automatically display the InfoWindow (label) for the tapped card's marker
                  _mapController.showMarkerInfoWindow(MarkerId(item.id));
                },
                child: Container(
                  height: 130,
                  width: 320,
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x0D000000),
                        offset: Offset(0, 4),
                        blurRadius: 8,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item.image,
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 90,
                              width: 90,
                              color: Colors.grey[300],
                              child:
                                  Icon(Icons.broken_image, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        item.price ?? "/mo",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Icon(
                                      Icons.favorite_border,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                "${distanceInKm.toStringAsFixed(2)} km away",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildIconTextRow(
                                      Icons.bed, item.bed!, 14, 4),
                                  _buildIconTextRow(
                                      Icons.bathtub, item.bathtub!, 14, 4),
                                  _buildIconTextRow(
                                      Icons.square_foot, item.sqft, 14, 4),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(
                                      PropertyDetailsScreen(
                                          propertyId: item.id),
                                    );
                                  },
                                  child: Text(
                                    "More Details",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  Widget _buildIconTextRow(
      IconData icon, String text, double iconSize, double spacing) {
    return Row(
      children: [
        Icon(icon, size: iconSize, color: Colors.grey),
        SizedBox(width: spacing),
        Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  void _addMarkers() async {
    _markers.clear(); // Clear existing markers

    // Add UPTM Campus Marker
    _markers.add(
      Marker(
        markerId: MarkerId("uptm_campus"),
        position: enterLocationController.uptmCampusLocation,
        infoWindow: InfoWindow(title: "UPTM Campus Cheras"),
      ),
    );

    // Add markers for accommodations from Firestore via the controller
    for (var item in enterLocationController.accommodationsList) {
      _markers.add(
        Marker(
          markerId: MarkerId(item.id),
          position: LatLng(item.latitude, item.longitude),
          infoWindow: InfoWindow(
            title: item.name,
            snippet: item.price,
            onTap: () {
              Get.to(PropertyDetailsScreen(propertyId: item.id));
            },
          ),
          onTap: () {
            _mapController.showMarkerInfoWindow(MarkerId(item.id));
          },
        ),
      );
    }

    setState(() {}); // Update the UI with the new markers
  }

  void _updateMapBounds() {
    if (_markers.isNotEmpty) {
      List<LatLng> allPositions =
          _markers.map((marker) => marker.position).toList();

      double southWestLat =
          allPositions.map((p) => p.latitude).reduce((a, b) => a < b ? a : b);
      double southWestLng =
          allPositions.map((p) => p.longitude).reduce((a, b) => a < b ? a : b);
      double northEastLat =
          allPositions.map((p) => p.latitude).reduce((a, b) => a > b ? a : b);
      double northEastLng =
          allPositions.map((p) => p.longitude).reduce((a, b) => a > b ? a : b);

      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(southWestLat, southWestLng),
        northeast: LatLng(northEastLat, northEastLng),
      );

      _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    }
  }

  void _addSearchMarker(LatLng position, String title) {
    _markers.add(
      Marker(
        markerId: MarkerId('search_result'),
        position: position,
        infoWindow: InfoWindow(
          title: title,
          snippet: 'Searched Location',
        ),
      ),
    );
    setState(() {}); // Refresh the UI
  }
}
