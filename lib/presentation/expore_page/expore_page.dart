import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  @override
  void initState() {
    super.initState();
    _setInitialLocation();

    // Retrieve the search query from HomeScreenContainerController
    final HomeScreenContainerController homeController = Get.find();
    String query = homeController.searchQuery.value;
    if (query.isNotEmpty) {
      enterLocationController.searchController.text = query;
      enterLocationController
          .searchAccommodations(query); // Trigger search directly
    }
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
                      .setMapController(controller); // Set the map controller
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
                        enterLocationController.searchAccommodations(query);
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
    _markers.clear(); // Clear markers to avoid duplication

    // Add UPTM Campus Marker
    _markers.add(
      Marker(
        markerId: MarkerId("uptm_campus"),
        position: enterLocationController.uptmCampusLocation,
        infoWindow: InfoWindow(title: "UPTM Campus Cheras"),
      ),
    );

    // Add default markers for each accommodation
    for (var item in enterLocationController.accommodationsList) {
      _markers.add(
        Marker(
          markerId: MarkerId(item.id),
          position: LatLng(item.latitude, item.longitude),
          // Use default Google Maps marker by removing the icon parameter
          infoWindow: InfoWindow(
            title: item.name,
            snippet:
                item.price, // Display the price as a snippet in the info window
            onTap: () {
              // Navigate to property details when info window is tapped
              Get.to(PropertyDetailsScreen(propertyId: item.id));
            },
          ),
          onTap: () {
            // Show info window with price label when marker is tapped
            _mapController.showMarkerInfoWindow(MarkerId(item.id));
          },
        ),
      );
    }
    setState(() {}); // Update the UI to reflect the new markers
  }

  void _updateMapBounds() {
    if (enterLocationController.currentPosition != null) {
      LatLng currentLatLng = LatLng(
        enterLocationController.currentPosition!.latitude,
        enterLocationController.currentPosition!.longitude,
      );

      if (_markers.isNotEmpty) {
        List<LatLng> allPositions = [
          currentLatLng,
          enterLocationController.uptmCampusLocation,
          ...enterLocationController.accommodationsList
              .map((item) => LatLng(item.latitude, item.longitude))
        ];

        double southWestLat =
            allPositions.map((p) => p.latitude).reduce((a, b) => a < b ? a : b);
        double southWestLng = allPositions
            .map((p) => p.longitude)
            .reduce((a, b) => a < b ? a : b);
        double northEastLat =
            allPositions.map((p) => p.latitude).reduce((a, b) => a > b ? a : b);
        double northEastLng = allPositions
            .map((p) => p.longitude)
            .reduce((a, b) => a > b ? a : b);
        LatLngBounds bounds = LatLngBounds(
          southwest: LatLng(southWestLat, southWestLng),
          northeast: LatLng(northEastLat, northEastLng),
        );

        _mapController.animateCamera(
          CameraUpdate.newLatLngBounds(bounds, 50),
        );
      }
    }
  }
}
