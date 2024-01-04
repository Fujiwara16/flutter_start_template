// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_bloc.dart';

enum SplashStateEnum {
  initial,
  loading,
  infoSliderVisible,
  navigateToHomeScreen,
  confirmationScreenVisible,
  error
}

class SplashState {
  final SplashStateEnum state;
  SplashState({
    this.state = SplashStateEnum.initial,
  });
}
