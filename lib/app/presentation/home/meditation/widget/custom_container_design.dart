import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/meditation/view/meditation_music_page.dart';

class CustomMeditationContainer extends StatelessWidget {
  final String img;
  final String? musicBigImg;

  const CustomMeditationContainer({
    Key? key,
    required this.img,
    required this.musicBigImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MusicPage(
                      img: musicBigImg ?? '',
                    )));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: [
            Image.asset(
              img,
              height: ScreenSize.screenWidth * 0.45,
              width: ScreenSize.screenWidth * 0.45,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: ScreenSize.screenHeight * 0.07,
                width: ScreenSize.screenWidth * 0.45,
                color: const Color.fromARGB(200, 17, 20, 44),
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('\nLorem ipsum\nLorem ipsum  2:34',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                        Image.asset(
                          'assets/meditation/icon/btn_play.png',
                          width: ScreenSize.screenWidth * 0.1,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
