import 'package:flutter/material.dart';
import 'package:u_drive_app/screens/registration_star_screen.dart';
import 'package:u_drive_app/screens/welcome_screen.dart';
import 'package:u_drive_app/assets/styles/app_colors.dart';
import 'package:u_drive_app/assets/styles/text_styles.dart';
import 'package:u_drive_app/widgets/default_button.dart';

import '../widgets/date_picker.dart';

class EnterBirthdayScreen extends StatefulWidget {
  const EnterBirthdayScreen({Key? key}) : super(key: key);

  @override
  State<EnterBirthdayScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterBirthdayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3364,
            ),
            const Text(
              'When is your birthday?',
              style: StylesText.w400s28,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0154,
            ),
            Text(
              'In your profile, you can specify\n who will see it.',
              textAlign: TextAlign.center,
              style:
                  StylesText.w400s15.copyWith(color: AppColors.helpTextColor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
            AppDatePicker(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0213,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: DefaultButton(text: 'Next', onPressed: () {}),
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
