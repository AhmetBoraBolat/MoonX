import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicViewModel extends ChangeNotifier {
  final AudioPlayer player = AudioPlayer();
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  bool get isPlaying => _isPlaying;
  Duration get duration => _duration;
  Duration get position => _position;

  StreamSubscription<PlayerState>? playerStateChangedSubscription;
  StreamSubscription<Duration>? durationChangedSubscription;
  StreamSubscription<Duration>? positionChangedSubscription;

  void init() {
    playerStateChangedSubscription =
        player.onPlayerStateChanged.listen((state) {
      _isPlaying = state == PlayerState.playing;
      notifyListeners();
    });
    durationChangedSubscription =
        player.onDurationChanged.listen((newDuration) {
      _duration = newDuration;
      notifyListeners();
    });
    positionChangedSubscription =
        player.onPositionChanged.listen((newPosition) {
      _position = newPosition;
      notifyListeners();
    });
  }

  void togglePlayPause(String audioPath) {
    if (_isPlaying) {
      player.pause();
    } else {
      player.play(AssetSource(audioPath));
    }
  }

  void seekTo(double value) {
    final position = Duration(seconds: value.toInt());
    player.seek(position);
    player.resume();
  }

  void stop() {
    player.stop();
    // player.dispose();
    playerStateChangedSubscription?.cancel();
    durationChangedSubscription?.cancel();
    positionChangedSubscription?.cancel();
  }

  void restart() {
    player.seek(Duration.zero);
    player.resume();
  }

  void rewind() {
    Duration newPosition = _position - const Duration(seconds: 10);
    if (newPosition.isNegative) {
      newPosition = Duration.zero;
    }
    player.seek(newPosition);
  }

  void fastForward() {
    Duration newPosition = _position + const Duration(seconds: 10);
    if (newPosition > _duration) {
      newPosition = _duration;
    }
    player.seek(newPosition);
  }

  String formatPosition() {
    return '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  String formatDuration() {
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
}
