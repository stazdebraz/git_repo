import 'package:flutter/material.dart';
import 'package:u_drive_app/screens/welcome_screen.dart';
import 'package:u_drive_app/assets/styles/app_colors.dart';
import 'package:u_drive_app/assets/styles/text_styles.dart';
import 'package:u_drive_app/widgets/default_button.dart';

class RegistrationStartScreen extends StatelessWidget {
  const RegistrationStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.34,
                  ),
                  const Text(
                    'Registation in UDrive',
                    style: StylesText.w500s28,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0236,
                  ),
                  Text(
                    'We can help you create an\n account in a few steps.',
                    style: StylesText.w300s15
                        .copyWith(color: AppColors.helpTextColor),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0438,
                  ),
                  DefaultButton(
                    text: 'Start',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
              child: Column(
                children: [
                  const Divider(
                    thickness: 0.8,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0165,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Are you already registered with UDrive ?',
                      style: StylesText.w300s15.copyWith(
                        color: const Color(0xff0F7BDD),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
