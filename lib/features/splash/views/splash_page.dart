import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pro_media_app/features/splash/bloc/splash_bloc.dart';
import 'package:pro_media_app/features/splash/views/splash_view.dart';
import 'package:pro_media_app/services/navigation_service.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is Success) {
          GoRouter.of(context).go(NavigationService.home);
        }
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SplashView(),
      ),
    );
  }
}
