import 'package:flutter/material.dart';
import 'package:u_drive_app/assets/styles/text_styles.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: const CustomDivider(),
          width: MediaQuery.of(context).size.width * 0.37,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.0153,
        ),
        const Text(
          'or',
          style: StylesText.w700s18,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.0153,
        ),
        SizedBox(
          child: const CustomDivider(),
          width: MediaQuery.of(context).size.width * 0.37,
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: const Divider(
        color: Color(0xff585858),
        thickness: 0.3,
      ),
      width: MediaQuery.of(context).size.width * 0.37,
    );
  }
}
