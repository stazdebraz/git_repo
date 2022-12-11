import 'package:flutter/material.dart';
import 'package:u_drive_app/logo_assets.dart';
import 'package:u_drive_app/services/auth_via_facebook.dart';
import 'package:u_drive_app/services/auth_via_google.dart';

import '../screens/enter_birthday_screen.dart';

class OtherRegistration extends StatelessWidget {
  OtherRegistration({
    Key? key,
  }) : super(key: key);
  AuthGoogle _authGoogle = AuthGoogle();
  AuthFacebook _authFacebook = AuthFacebook();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LogoButton(
          logo: AppAssets.google,
          onTap: () async {
            await _authGoogle.signInWithGoogle();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const EnterBirthdayScreen()),
                (route) => false);
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.0846,
        ),
        LogoButton(
          logo: AppAssets.facebook,
          onTap: () async {
            await _authFacebook.signInWithFacebook();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const EnterBirthdayScreen()),
                (route) => false);
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.0846,
        ),
        LogoButton(
          logo: AppAssets.apple,
          onTap: () {},
        ),
      ],
    );
  }
}

class LogoButton extends StatelessWidget {
  const LogoButton({Key? key, required this.logo, required this.onTap})
      : super(key: key);
  final String logo;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(logo),
    );
  }
}
