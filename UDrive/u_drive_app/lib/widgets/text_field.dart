import 'package:flutter/material.dart';
import 'package:u_drive_app/assets/styles/app_colors.dart';
import 'package:u_drive_app/assets/styles/text_styles.dart';

class DefaultTextFiled extends StatelessWidget {
  DefaultTextFiled(
      {Key? key,
      required this.hintText,
      this.textType = TextInputType.name,
      this.onChanged,
      required this.controller,
      this.obscureText = false})
      : super(key: key);
  final String hintText;
  final TextInputType textType;
  final Function()? onChanged;
  TextEditingController controller = TextEditingController();
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.058,
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: textType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: StylesText.w400s16.copyWith(color: AppColors.greyText),
          border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.6, color: AppColors.textField),
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
