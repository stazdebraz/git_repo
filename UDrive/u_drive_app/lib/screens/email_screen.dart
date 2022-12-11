import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:u_drive_app/services/auth.dart';
import 'package:u_drive_app/screens/enter_name_screen.dart';
import 'package:u_drive_app/screens/welcome_screen.dart';
import 'package:u_drive_app/assets/styles/text_styles.dart';
import 'package:u_drive_app/widgets/default_button.dart';
import 'package:u_drive_app/widgets/text_field.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';

class EnterEmailScreen extends StatefulWidget {
  const EnterEmailScreen({Key? key, required this.name, required this.surname})
      : super(key: key);
  final String name;
  final String surname;

  @override
  State<EnterEmailScreen> createState() => _EnterNameScreenState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController passwordConfrim = TextEditingController();
AuthService _authService = AuthService();
bool isValidEmail = false;

class _EnterNameScreenState extends State<EnterEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const Text(
                'Enter your email adress',
                style: StylesText.w400s28,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0154,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.008,
              ),
              DefaultTextFiled(
                hintText: 'Email',
                controller: email,
                onChanged: () {
                  if (EmailValidator.validate(email.text)) {
                    isValidEmail = true;
                  } else {
                    isValidEmail = false;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Invalid email adress'),
                    ));
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0264,
              ),
              DefaultTextFiled(
                hintText: 'Enter your password',
                controller: password,
                obscureText: true,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0264,
              ),
              DefaultTextFiled(
                hintText: 'Confrim your password',
                controller: passwordConfrim,
                obscureText: true,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.0213,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: DefaultButton(
                    text: 'Next',
                    onPressed: () {
                      if (isValidEmail) {
                        if (password.text == passwordConfrim.text) {
                          _authService.signUp(email.text, password.text);
                          _authService.setUserNameAndSurname('$name $surname');
                        }
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              'Invalid email adress or this email is already used'),
                        ));
                      }
                    }),
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
      ),
    );
  }
}
