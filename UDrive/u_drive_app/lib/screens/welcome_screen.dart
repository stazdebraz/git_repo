import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_drive_app/assets/styles/text_styles.dart';
import 'package:u_drive_app/services/auth.dart';
import 'package:u_drive_app/screens/enter_birthday_screen.dart';
import 'package:u_drive_app/widgets/app_divider.dart';
import 'package:u_drive_app/widgets/default_button.dart';
import 'package:u_drive_app/widgets/other_registration.dart';
import 'package:u_drive_app/widgets/registration_text.dart';

import '../widgets/text_field.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
AuthService _auth = AuthService();

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0414,
                ),
                const Text(
                  'Lets Sign you in',
                  style: StylesText.w700s37,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0154,
                ),
                const Text(
                  'Welcome Back ,\nYou have been missed',
                  style: StylesText.w500s28,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0699,
                ),
                DefaultTextFiled(
                  hintText: 'Email ,phone & username',
                  controller: email,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0118,
                ),
                DefaultTextFiled(
                  hintText: 'Password',
                  controller: password,
                  obscureText: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0118,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: StylesText.w700s14,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0319,
                ),
                DefaultButton(
                    text: 'Sign In',
                    onPressed: () async {
                      User? user =
                          await _auth.signIn(email.text, password.text);
                      if (user != null) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EnterBirthdayScreen()),
                            (route) => false);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Incorrect email/password'),
                        ));
                      }
                    }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0213,
                ),
                const DefaultDivider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0331,
                ),
                OtherRegistration(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0568,
                ),
                const RegistrationText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void disposeController() {
  email.dispose();
  password.dispose();
}
