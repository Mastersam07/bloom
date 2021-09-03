import 'package:flutter/material.dart';

import '../../ui/shared/colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  final bool centered;

  const AppLoadingIndicator({Key key, this.centered = true}) : super(key: key);

  Widget _buildIndicator() {
    return const CircularProgressIndicator(
      strokeWidth: 1.5,
      backgroundColor: AppColors.yellowColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return centered ? Center(child: _buildIndicator()) : _buildIndicator();
  }
}
