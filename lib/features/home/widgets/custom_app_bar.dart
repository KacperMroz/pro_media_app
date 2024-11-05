import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_media_app/features/home/bloc/home_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key, required this.title, this.backgroundColor = Colors.white});

  final String title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    List<Widget> activeActions = [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    ];

    List<Widget> inActiveActions = const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: Icon(
          Icons.favorite_border_outlined,
          color: Colors.black,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    ];

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          title: state.isVideoPlaying ? null : Text(title),
          centerTitle: true,
          leading: state.isVideoPlaying
              ? Transform.scale(
                  scale: 0.6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                )
              : const Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 21,
                ),
          actions: state.isVideoPlaying ? activeActions : inActiveActions,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 74);
}
