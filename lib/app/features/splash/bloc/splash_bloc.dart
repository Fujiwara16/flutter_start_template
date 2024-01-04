import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<CheckInfoSliderVisibilityEvent>(checkInfoSliderVisibilityEvent);
  }

  void checkInfoSliderVisibilityEvent(
      CheckInfoSliderVisibilityEvent event, Emitter<SplashState> emit) {
    sleep(const Duration(seconds: 2));
    emit(SplashState(state: SplashStateEnum.navigateToHomeScreen));
  }
}
