import 'package:flutter/material.dart';
import 'package:moon_x/app/core/constructor/const_image.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/main/viewmodel/AI/main_page_ai_view_model.dart';
import 'package:provider/provider.dart';

class CustomCategoryBox extends StatelessWidget {
  const CustomCategoryBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSegmentedControl(0, 'Business', const Color(0xFF8E53D8),
              ImageEnum.homeCategoryBusiness.imagePath, 'Business', context),
          _buildSegmentedControl(1, 'Food', const Color(0xFFF07A22),
              ImageEnum.homeCategoryFood.imagePath, 'Food', context),
          _buildSegmentedControl(2, 'Relations', const Color(0xFF535FD8),
              ImageEnum.homeCategoryRelations.imagePath, 'Relations', context),
        ],
      ),
    );
  }

  Widget _buildSegmentedControl(int index, String label, Color color,
      String image, String category, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ScreenSize.screenWidth * 0.015),
      child: GestureDetector(
        onTap: () async {
          await context.read<MainPageAIViewModel>().changeCategory(category);
        },
        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color,
          ),
          child: Center(
            child: Row(
              children: [
                SizedBox(width: ScreenSize.screenWidth * 0.02),
                SizedBox(
                  child: Image.asset(
                    image,
                    height: ScreenSize.screenHeight * 0.05,
                  ),
                ),
                SizedBox(width: ScreenSize.screenWidth * 0.01),
                Padding(
                  padding: EdgeInsets.all(ScreenSize.screenWidth * 0.03),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
