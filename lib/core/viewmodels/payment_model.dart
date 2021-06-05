import '../constants/app_constants.dart';

import '../services/navigation.dart';
import '../../locator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rave_flutter/rave_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'base_model.dart';

class PaymentModel extends BaseModel {
  final _navigatorService = locator<NavigationService>();
  Future makePayment() async {
    // Get a reference to RavePayInitializer
    final initializer = RavePayInitializer(
        txRef: DateFormat('yyyymmddHMS').format(DateTime.now()),
        amount: 500,
        publicKey: DotEnv.env['publicKey'],
        encryptionKey: DotEnv.env['encryptionKey'])
      ..country = 'NG'
      ..currency = 'NGN'
      ..email = 'customer@email.com'
      ..fName = 'Ciroma'
      ..lName = 'Adekunle'
      // ..narration = narration ?? ''
      // ..txRef = DateFormat('yyyymmddHMS').format(DateTime.now())
      ..acceptMpesaPayments = false
      ..acceptAccountPayments = false
      ..acceptCardPayments = true
      ..acceptAchPayments = false
      ..acceptGHMobileMoneyPayments = false
      ..acceptUgMobileMoneyPayments = false
      ..staging = true
      ..companyName = const Text(
        'Bloom',
        style: TextStyle(fontSize: 14),
      )
      ..companyLogo = Image.asset(
        'assets/images/logo.png',
        height: 150,
      )
      ..displayFee = true;

    RavePayManager()
        .prompt(
            context: _navigatorService.navigationKey.currentContext,
            initializer: initializer)
        .then((result) async {
      debugPrint('Status: ${result.status}');
      debugPrint('Code: ${result.message}');
      if (result.status == RaveStatus.success) {
        Navigator.pushNamed(_navigatorService.navigationKey.currentContext,
            RoutePaths.Dashboard);
      } else if (result.status == RaveStatus.cancelled) {
      } else if (result.status == RaveStatus.error) {
        showDialog(
            context: _navigatorService.navigationKey.currentContext,
            builder: (_) {
              return AlertDialog(
                title: const Text(
                  'Error',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                content: const Text(
                  'An error has occured ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                actions: [
                  IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(
                                _navigatorService.navigationKey.currentContext)
                            .pop();
                      })
                ],
              );
            });
      }
    });

    // Initialize and get the transaction result
    // RaveResult response = await RavePayManager().prompt(
    //     context: _navigatorService.navigationKey.currentContext,
    //     initializer: initializer);
  }
}
