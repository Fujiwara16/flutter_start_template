import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? navigateTo(String routeName, {Object? args}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: args);
  }

  BuildContext? _getGlobalContext() =>
      navigatorKey.currentState?.overlay?.context;
  static BuildContext? getGlobalContext() =>
      GetIt.instance.get<NavigationService>()._getGlobalContext();
  Future<dynamic>? replaceAndNavigateTo(String routeName) {
    return navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  Future<dynamic>? replaceAllAndNavigateTo(String routeName, {Object? args}) {
    navigatorKey.currentState?.popUntil((settings) => settings.isFirst);
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: args);
  }

  bool _canPop() => navigatorKey.currentState?.canPop() ?? false;

  void pop<T>(T result) {
    return navigatorKey.currentState?.pop(result);
  }

  void popTillFirst() {
    return navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  static void pushNamed(String routeName, {Object? args}) =>
      GetIt.instance.get<NavigationService>().navigateTo(routeName, args: args);
  static void replaceAllAndPushNamed(String routeName, {Object? args}) =>
      GetIt.instance
          .get<NavigationService>()
          .replaceAllAndNavigateTo(routeName, args: args);
  static void pushReplacementNamed(String routeName) =>
      GetIt.instance.get<NavigationService>().replaceAndNavigateTo(routeName);
  static void popScreen({dynamic result}) =>
      GetIt.instance.get<NavigationService>().pop(result);
  static void popAll() =>
      GetIt.instance.get<NavigationService>().popTillFirst();
}
