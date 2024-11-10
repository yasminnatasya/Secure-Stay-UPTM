import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptm_secure_stay/presentation/home_screen_page/widgets/propertylist_item_widget.dart';
import 'controller/populr_property_controller.dart';
import 'package:uptm_secure_stay/widgets/animation_widget.dart';

class PopulrPropertyScreen extends StatefulWidget {
  const PopulrPropertyScreen({super.key});

  @override
  State<PopulrPropertyScreen> createState() => _PopulrPropertyScreenState();
}

class _PopulrPropertyScreenState extends State<PopulrPropertyScreen> {
  final PopulrPropertyController popularPropertyController =
      Get.put(PopulrPropertyController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopulrPropertyController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            color: Colors.grey[100],
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: Obx(() {
                    if (controller.popularPropertiesList.isEmpty) {
                      return Center(
                        child: Text("No popular properties found."),
                      );
                    }
                    return animationFunction(
                      0,
                      duration: Duration(milliseconds: 500),
                      GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 210,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: controller.popularPropertiesList.length,
                        itemBuilder: (context, index) {
                          var property =
                              controller.popularPropertiesList[index];
                          return RecommendedFormat(
                            image: property.image,
                            name: property.name,
                            address: property.address,
                            price: property.price,
                            type: property.type,
                            bed: property.bed,
                            likeOnTap: () {
                              property.isFavourite = !property.isFavourite;
                              controller.update();
                            },
                            likeImage: _buildAnimatedLikeIcon(
                                property.isFavourite), // Use animated icon
                            bathtub: property.bathtub,
                            onTap: () {
                              onTapProperty();
                            },
                          );
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Helper function for animated like icon
  Widget _buildAnimatedLikeIcon(bool isFavourite) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          isFavourite ? Colors.red : Colors.grey,
          BlendMode.srcIn,
        ),
        child: Image.asset(
          isFavourite
              ? 'assets/images/img_like_gray900.png'
              : 'assets/images/img_like.png',
          key: ValueKey(isFavourite ? 'liked' : 'unliked'),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(top: 18, bottom: 19),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Center(
        child: Text(
          "Popular Properties",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void onTapProperty() {
    Get.toNamed('/propertyDetailsScreen');
  }
}
