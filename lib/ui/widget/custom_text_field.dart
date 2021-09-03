import 'package:flutter/material.dart';

import '../shared/colors.dart';
import '../shared/styles.dart';
import '../shared/ui_helpers.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget suffixIcon;
  final bool obscure;

  const CustomTextFormField(
      {Key key,
      this.hintText,
      this.controller,
      this.suffixIcon,
      this.obscure = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenAwareSize(32, context)),
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.bodyRegularMedium.copyWith(
            color: AppColors.hintColor,
          ),
          suffixIcon: suffixIcon,
          fillColor: AppColors.textFieldColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const PasswordField({Key key, this.hintText, this.controller})
      : super(key: key);
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscure = false;
  void switchObscureIcon() {
    setState(() {
      obscure = !obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscure: obscure,
      hintText: widget.hintText,
      controller: widget.controller,
      suffixIcon: obscure
          ? GestureDetector(
              onTap: switchObscureIcon, child: const Icon(Icons.visibility))
          : GestureDetector(
              onTap: switchObscureIcon,
              child: const Icon(Icons.visibility_off)),
    );
  }
}
