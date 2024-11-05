import 'package:flutter/material.dart';
import 'package:pro_media_app/features/home/widgets/semicircle_app_button.dart';
import 'package:pro_media_app/features/home/widgets/staggered_grid_view.dart';
import 'package:pro_media_app/features/home/widgets/video_animated_container.dart';
import 'package:video_player/video_player.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.isVideoPlaying,
    required this.onDownArrowPressed,
    required this.controller,
  });

  final bool isVideoPlaying;
  final VoidCallback onDownArrowPressed;
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoAnimatedContainer(isVideoPlaying: isVideoPlaying, controller: controller),
        AnimatedPadding(
          padding: EdgeInsets.only(top: isVideoPlaying ? 265 : 140),
          duration: const Duration(seconds: 1),
          curve: Curves.linear,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Polecane',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    SemicircleAppButton(onDownArrowPressed: onDownArrowPressed),
                  ],
                ),
                const StaggeredGridView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
