import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/services/service.dart';
import 'core/viewmodels/login_model.dart';
import 'core/viewmodels/signup_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  /// register services
  locator.registerLazySingleton<Service>(() => Service());

  /// register models
  locator.registerFactory<LoginModel>(() => LoginModel());
  locator.registerFactory<SignupModel>(() => SignupModel());
}

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => LoginModel()),
  ChangeNotifierProvider(create: (_) => SignupModel()),
];
