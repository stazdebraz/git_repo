import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_drive_app/services/auth.dart';
import 'package:u_drive_app/screens/email_screen.dart';
import 'package:u_drive_app/screens/welcome_screen.dart';
import 'package:u_drive_app/assets/styles/app_colors.dart';
import 'package:u_drive_app/assets/styles/text_styles.dart';
import 'package:u_drive_app/widgets/default_button.dart';
import 'package:u_drive_app/widgets/text_field.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({Key? key}) : super(key: key);

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

TextEditingController name = TextEditingController();
TextEditingController surname = TextEditingController();
AuthService _authService = AuthService();
bool _keyboardVisible = false;

class _EnterNameScreenState extends State<EnterNameScreen> {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3364,
            ),
            const Text(
              'What’s your name ?',
              style: StylesText.w400s28,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0663,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      child: DefaultTextFiled(
                        hintText: 'Name',
                        controller: name,
                      ),
                      width: MediaQuery.of(context).size.width * 0.3717,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.039,
                  ),
                  Flexible(
                    child: SizedBox(
                      child: DefaultTextFiled(
                        hintText: 'Surname',
                        controller: surname,
                      ),
                      width: MediaQuery.of(context).size.width * 0.3717,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0367,
            ),
            _keyboardVisible
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 33),
                    child: DefaultButton(
                        text: 'Accept',
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EnterEmailScreen(
                                        name: name.text,
                                        surname: surname.text,
                                      )),
                              (route) => false);
                        }),
                  )
                : Text(
                    'If you use your real name, it will be \neasier for friends to find you.',
                    textAlign: TextAlign.center,
                    style: StylesText.w400s15
                        .copyWith(color: AppColors.helpTextColor),
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
