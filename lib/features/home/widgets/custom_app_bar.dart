import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_media_app/features/home/bloc/home_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key,
    required this.title,
    this.actions = const [
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
    ],
    this.backgroundColor = Colors.white});

  final String title;
  final List<Widget> actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return AppBar(
          backgroundColor: Colors.transparent,
          title: Text(title),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              print(context.read<HomeCubit>().state.isVideoPlaying);
            },
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
          ),
          actions: actions,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 74);
}
