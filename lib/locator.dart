import 'package:bloom/repository/auth_repo.dart';
import 'package:bloom/services/database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/services/navigation.dart';
import 'core/services/service.dart';
import 'core/viewmodels/login_model.dart';
import 'core/viewmodels/payment_model.dart';
import 'core/viewmodels/signup_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  /// register services
  locator.registerLazySingleton<Service>(() => Service());
  locator.registerLazySingleton<AuthRepo>(
      () => AuthenticationRepository(locator()));
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

  /// register viewmodels
  locator.registerFactory<LoginModel>(() => LoginModel(locator()));
  locator.registerFactory<SignupModel>(() => SignupModel(locator()));
  locator.registerFactory<PaymentModel>(() => PaymentModel());
}

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => LoginModel(locator())),
  ChangeNotifierProvider(create: (_) => SignupModel(locator())),
  ChangeNotifierProvider(create: (_) => PaymentModel()),
];
