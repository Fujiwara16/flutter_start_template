import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:surat_saheli_mobile_client/app/commons/navigation_service.dart';
import 'package:surat_saheli_mobile_client/app/utils/route_utils.dart';

import '../bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {
  final splashBloc = GetIt.instance<SplashBloc>();

  @override
  void initState() {
    super.initState();
    splashBloc.add(CheckInfoSliderVisibilityEvent());
  }

  @override
  void dispose() {
    super.dispose();
    splashBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer(
          bloc: splashBloc,
          builder: _getBody,
          listener: _onStateChanged,
        ),
      ),
    );
  }

  Widget _getBody(BuildContext context, SplashState state) {
    switch (state.state) {
      // return ImageUtils.getSvgImageWidget(
      //   AssetImages.bhanzuLogo,
      //   width: SizeUtils.getLogoWidth(context),
      // );
      case SplashStateEnum.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case SplashStateEnum.navigateToHomeScreen:
      case SplashStateEnum.initial:
        return const Center(
            child: Text(
          "Loading...",
          style: TextStyle(color: Colors.black),
        ));
      case SplashStateEnum.infoSliderVisible:
      case SplashStateEnum.error:
        // listener case.
        break;
      case SplashStateEnum.confirmationScreenVisible:
      // TODO: Handle this case.
    }
    return Container();
  }

  void _onStateChanged(BuildContext context, SplashState state) {
    switch (state.state) {
      case SplashStateEnum.error:
        break;
      case SplashStateEnum.initial:
      // widget case
      case SplashStateEnum.loading:
      // widget case
      case SplashStateEnum.infoSliderVisible:
        break;
      case SplashStateEnum.confirmationScreenVisible:
        // widget case
        break;
      case SplashStateEnum.navigateToHomeScreen:
        print("checking");
        // NavigationService.replaceAllAndPushNamed(RouteNames.home);
        break;
    }
  }
}
