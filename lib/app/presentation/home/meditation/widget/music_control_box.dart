import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:moon_x/app/core/helper/screen_size.dart';
import 'package:moon_x/app/presentation/home/meditation/viewmodel/music_page_view_model.dart';
import 'package:provider/provider.dart';

class MusicControlWidget extends StatefulWidget {
  const MusicControlWidget({
    super.key,
  });

  @override
  State<MusicControlWidget> createState() => _MusicControlWidgetState();
}

class _MusicControlWidgetState extends State<MusicControlWidget>
    with SingleTickerProviderStateMixin {
  bool _isMusicPlaying = false;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    context.read<MusicViewModel>().playerStateChangedSubscription =
        context.read<MusicViewModel>().player.onPlayerStateChanged.listen(
      (state) {
        if (state == PlayerState.playing) {
          _isMusicPlaying = true;

          _isVisible = true;
        } else if (state == PlayerState.completed) {
          _isMusicPlaying = false;
          _isVisible = false;
        }
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Container(
        height: _isMusicPlaying ? null : 0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(153, 70, 70, 70),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: _isVisible
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<MusicViewModel>()
                              .togglePlayPause('/music/aksam_gunesi.mp3');
                        },
                        child: Consumer<MusicViewModel>(
                          builder: (context, musicViewModel, child) {
                            return Image.asset(
                              musicViewModel.isPlaying
                                  ? '/Users/bora/Desktop/moon_x/assets/meditation/icon/btn_pause2-1.png'
                                  : '/Users/bora/Desktop/moon_x/assets/meditation/icon/btn_pause2.png',
                              width: ScreenSize.screenWidth * 0.11,
                            );
                          },
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aytaç Doğan - Akşam Güneşi',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Aytaç Doğan'),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isVisible = false;
                          });
                          context.read<MusicViewModel>().stop();
                        },
                        child: Image.asset(
                          '/Users/bora/Desktop/moon_x/assets/meditation/icon/btn_close.png',
                          width: ScreenSize.screenWidth * 0.11,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: ScreenSize.screenWidth,
                    height: 5,
                    child: Consumer<MusicViewModel>(
                      builder: (context, musicViewModel, child) {
                        return LinearProgressIndicator(
                          value: musicViewModel.position.inSeconds.toDouble() /
                              musicViewModel.duration.inSeconds.toDouble(),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFF535FD8)),
                          backgroundColor: Colors.white,
                        );
                      },
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
