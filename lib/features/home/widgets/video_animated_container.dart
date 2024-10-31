import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoAnimatedContainer extends StatelessWidget {
  const VideoAnimatedContainer({
    super.key,
    required this.isVideoPlaying,
    required this.controller,
  });

  final bool isVideoPlaying;
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      constraints: BoxConstraints(
        maxHeight: isVideoPlaying ? 300 : 150,
        minHeight: isVideoPlaying ? 300 : 74,
      ),
      height: isVideoPlaying ? 300 : 130,
      decoration: isVideoPlaying
          ? const BoxDecoration(
          color: Colors.transparent
      )
          : const BoxDecoration(
        color: Colors.white,
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
      child: isVideoPlaying
          ? VideoPlayer(controller)
          : Container(),
    );
  }
}