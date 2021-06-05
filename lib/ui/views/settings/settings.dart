import '../../../core/viewmodels/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<PaymentModel>(
          builder: (context, model, _) => ElevatedButton(
            onPressed: () => model.makePayment(),
            child: const Text('Pay now'),
          ),
        ),
      ),
    );
  }
}
