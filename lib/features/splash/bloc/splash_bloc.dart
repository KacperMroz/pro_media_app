import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_bloc.freezed.dart';

@injectable
class SplashCubit extends Cubit<SplashState>{
  SplashCubit() : super(const Initial());

  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 4));
    emit(const Success());
  }
}

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = Initial;
  const factory SplashState.success() = Success;
  const factory SplashState.error() = Error;
}