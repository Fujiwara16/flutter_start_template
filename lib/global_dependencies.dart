import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:surat_saheli_mobile_client/app/commons/navigation_service.dart';

import 'global_dependencies.config.dart';

final getIt = GetIt.instance;

class GlobalDependencies {
  void init() {
    GetIt.I.registerLazySingleton<NavigationService>(NavigationService.new);
  }
}

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false,
)
GetIt configureDependencies() => init(getIt);
