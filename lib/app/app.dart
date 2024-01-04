import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:surat_saheli_mobile_client/app/commons/navigation_service.dart';
import 'package:surat_saheli_mobile_client/app/utils/route_utils.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => "Surat Saheli",
      debugShowCheckedModeBanner: false,
      navigatorKey: GetIt.I<NavigationService>().navigatorKey,
      // navigatorObservers: [AppNavigationObserver()],
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: RouteUtils.getRouteGenerator,
      initialRoute: RouteNames.splash,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
    );
  }
}
