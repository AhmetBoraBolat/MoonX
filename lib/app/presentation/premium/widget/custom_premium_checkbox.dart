import 'package:flutter/material.dart';
import 'package:moon_x/app/core/constructor/const_image.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';

class PremiumCheckBox extends StatelessWidget {
  const PremiumCheckBox({
    super.key,
    required this.popular,
    required this.text,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });

  final bool popular;
  final String text;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ScreenSize.screenHeight * 0.01),
        child: Stack(children: [
          Container(
            height: ScreenSize.screenHeight * 0.07,
            width: ScreenSize.screenWidth * 0.8,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF181D38)
                  : const Color(0xFF121212),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF535FD8)
                    : const Color(0xFF050505),
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                isSelected
                    ? Image.asset(
                        ImageEnum.premiumCheckBoxSelected.imagePath,
                        height: 20,
                      )
                    : Image.asset(
                        ImageEnum.premiumCheckBoxUnselected.imagePath,
                        height: 20,
                      ),
                Text(text),
                Text('\$$price'),
              ],
            ),
          ),
          popular
              ? Padding(
                  padding: EdgeInsets.only(left: ScreenSize.screenWidth * 0.5),
                  child: SizedBox(
                    height: ScreenSize.screenHeight * 0.018,
                    child: Image.asset(
                        ImageEnum.premiumCheckMostPopular.imagePath),
                  ),
                )
              : const SizedBox.shrink(),
        ]),
      ),
    );
  }
}
