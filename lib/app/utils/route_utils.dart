import 'package:flutter/material.dart';
import 'package:surat_saheli_mobile_client/app/features/splash/pages/splash_screen.dart';

enum RouteEnum { pop, push }

class RouteNames {
  static const String splash = '/';
  static const String home = '/home';
}

class RouteUtils {
  static Route<dynamic> getRouteGenerator(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splash:
        return _getAppObserverMaterialRoute(
            settings: routeSettings,
            builder: (context) => const SplashScreen());
      default:
        return _getAppObserverMaterialRoute(
            settings: routeSettings,
            builder: (context) => const SplashScreen());
    }
  }

  static MaterialPageRoute _getAppObserverMaterialRoute(
      {required RouteSettings settings, required WidgetBuilder builder}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => builder(context),
    );
  }
}
