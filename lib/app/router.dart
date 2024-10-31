import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pro_media_app/features/home/bloc/home_bloc.dart';
import 'package:pro_media_app/features/home/views/home_page.dart';
import 'package:pro_media_app/features/splash/bloc/splash_bloc.dart';
import 'package:pro_media_app/injection/injection.dart';
import 'package:pro_media_app/services/navigation_service.dart';

import '../features/splash/views/splash_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: NavigationService.splash,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt.get<SplashCubit>()..initialize(),
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        path: NavigationService.home,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt.get<HomeCubit>(),
          child: const HomePage(),
        ),
      ),
    ]);
