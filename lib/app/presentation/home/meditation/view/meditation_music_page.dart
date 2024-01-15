import 'package:flutter/material.dart';
import 'package:moon_x/app/core/consturactor/const_text.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/core/icon/moon_x_music_icons_icons.dart';
import 'package:moon_x/app/presentation/home/meditation/viewmodel/music_page_view_model.dart';
import 'package:provider/provider.dart';

class MusicPage extends StatefulWidget {
  final String img;
  const MusicPage({super.key, required this.img});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  bool like = false;
  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MusicViewModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            widget.img,
            fit: BoxFit.fill,
            width: ScreenSize.screenWidth,
          ),
          _backButton(context),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.only(bottom: ScreenSize.screenHeight * 0.09),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ConstText.dashboardBoldTxt('Lorem ipsum', 20),
                  SizedBox(height: ScreenSize.screenHeight * 0.04),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.screenWidth * 0.03),
                    child: Slider(
                      activeColor: const Color(0xFF535FD8),
                      inactiveColor: const Color(0xFF505050),
                      min: 0,
                      value: context
                          .watch<MusicViewModel>()
                          .position
                          .inSeconds
                          .toDouble(),
                      max: context
                          .watch<MusicViewModel>()
                          .duration
                          .inSeconds
                          .toDouble(),
                      onChanged: (value) {
                        context.read<MusicViewModel>().seekTo(value);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.screenWidth * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(context.read<MusicViewModel>().formatPosition()),
                        Text(context.read<MusicViewModel>().formatDuration()),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenSize.screenHeight * 0.05),
                  _musicButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _musicButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            context.read<MusicViewModel>().restart();
          },
          icon: const Icon(
            size: 20,
            MoonXMusicIcons.btn_refresh_playlist,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<MusicViewModel>().rewind();
          },
          icon: const Icon(
            size: 15,
            MoonXMusicIcons.btn_back_playlist,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            context
                .read<MusicViewModel>()
                .togglePlayPause('music/aksam_gunesi.mp3');
          },
          child: SizedBox(
            child: Image.asset(
              'assets/meditation/icon/btn_play_playlist.png',
              height: 50,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<MusicViewModel>().fastForward();
          },
          icon: const Icon(
            size: 15,
            MoonXMusicIcons.btn_next_playlist,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              like = !like;
            });
          },
          icon: Icon(
            size: 15,
            MoonXMusicIcons.btn_fav_playlist,
            color: like ? Colors.red : Colors.white,
          ),
        ),
      ],
    );
  }

  Positioned _backButton(BuildContext context) {
    return Positioned(
      left: ScreenSize.screenWidth * 0.01,
      top: ScreenSize.screenHeight * 0.05,
      child: IconButton(
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
        iconSize: ScreenSize.screenHeight * 0.045,
        icon: const Icon(
          MoonXMusicIcons.btn_dropdown_arrow,
          color: Colors.white,
        ),
      ),
    );
  }
}
