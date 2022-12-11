import 'package:flutter/material.dart';
import 'package:u_drive_app/assets/styles/app_colors.dart';
import 'package:u_drive_app/assets/styles/text_styles.dart';
import 'package:u_drive_app/screens/enter_name_screen.dart';

class RegistrationText extends StatelessWidget {
  const RegistrationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't' have an account ? ",
          style: StylesText.w400s16
              .copyWith(color: AppColors.greyText, shadows: <Shadow>[
            Shadow(
                blurRadius: 6,
                offset: const Offset(0.0, 3.0),
                color: const Color(0xff000000).withOpacity(0.25))
          ]),
        ),
        InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const EnterNameScreen()),
                (route) => false);
          },
          child: Text(
            'Register Now',
            style: StylesText.w700s16
                .copyWith(color: Colors.black, shadows: <Shadow>[
              Shadow(
                  blurRadius: 6,
                  offset: const Offset(0.0, 3.0),
                  color: const Color(0xff000000).withOpacity(0.25))
            ]),
          ),
        )
      ],
    );
  }
}
