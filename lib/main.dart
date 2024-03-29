import 'core/services/navigation.dart';
import 'ui/views/splashscreen.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'ui/router.dart';
import 'ui/shared/colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv.load(fileName: '.env');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor,
        systemNavigationBarColor: AppColors.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark));
    return MultiProvider(
      providers: allProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloom',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const Splash(),
        navigatorKey: locator<NavigationService>().navigationKey,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
