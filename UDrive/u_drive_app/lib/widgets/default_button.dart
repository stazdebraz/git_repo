import 'package:flutter/material.dart';
import 'package:u_drive_app/assets/styles/text_styles.dart';

class DefaultButton extends StatefulWidget {
  const DefaultButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function() onPressed;
  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.058,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xff0F7BDD),
          ),
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: StylesText.w500s18,
          )),
    );
  }
}
