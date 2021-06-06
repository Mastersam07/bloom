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
          builder: (context, model, _) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => model.makePayment(),
                child: const Text('Pay now method A'),
              ),
              ElevatedButton(
                onPressed: () => model.beginPayment(),
                child: const Text('Pay now method B'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Test MasterCard PIN authentication
// Card number: 5531 8866 5214 2950
// cvv: 564
// Expiry: 09/32
// Pin: 3310
// OTP: 12345

// Test Verve Card (PIN)
// Card number: 5061 4604 1012 0223 210

// cvv: 780

// Expiry Month: 12

// Expiry Year: 31

// Pin: 3310

// OTP: 12345
