import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_media_app/features/home/bloc/home_bloc.dart';
import 'package:pro_media_app/features/home/views/home_view.dart';
import 'package:pro_media_app/features/home/widgets/custom_app_bar.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/film.mp4');
    _controller.addListener(() {
      if(!_controller.value.isPlaying && _controller.value.position == _controller.value.duration) {
        context.read<HomeCubit>().stopPlayingVideo();
      }
    });
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(title: 'Logo',),
          extendBodyBehindAppBar: true,
          body: HomeView(isVideoPlaying: state.isVideoPlaying, onDownArrowPressed: () => onDownArrowPressed(context), controller: _controller,),
        );
      },
    );
  }

  void onDownArrowPressed(BuildContext context) async {
    if(context.read<HomeCubit>().state.isVideoPlaying) {
      _controller.pause();
      _controller.seekTo(const Duration(seconds: 0));
      context.read<HomeCubit>().stopPlayingVideo();
    } else {
      await  _controller.play();
      context.read<HomeCubit>().startPlayingVideo();
      Future.delayed(Duration(seconds: 1));
    }
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }
}
