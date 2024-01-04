import 'package:flutter/material.dart';
import 'package:surat_saheli_mobile_client/app/app.dart';

import 'package:surat_saheli_mobile_client/global_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Init dependencies
  GlobalDependencies().init();

  configureDependencies();
  runApp(const App());
}
