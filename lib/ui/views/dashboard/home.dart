import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../../shared/styles.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text(
          'Home View',
          style: AppTextStyles.bodyRegularMedium,
        ),
      ),
    );
  }
}
