import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(isVideoPlaying: true));

  Future<void> startPlayingVideo() async {
    emit(state.copyWith(isVideoPlaying: true));
  }

  Future<void> stopPlayingVideo() async {
    emit(state.copyWith(isVideoPlaying: false));
  }
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isVideoPlaying,
  }) = _HomeState;

  const HomeState._();
}
