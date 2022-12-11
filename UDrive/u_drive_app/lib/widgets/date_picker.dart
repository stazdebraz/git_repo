// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:u_drive_app/assets/styles/text_styles.dart';

class AppDatePicker extends StatefulWidget {
  AppDatePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<AppDatePicker> createState() => _DatePickerState();
}

String _date = "01 January of 2020";

List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

class _DatePickerState extends State<AppDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.058,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.white.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    side: BorderSide(color: Colors.grey.withOpacity(0.6))),
              ),
              onPressed: () {
                DatePicker.showDatePicker(context,
                    theme: const DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true,
                    minTime: DateTime(1900, 1, 1),
                    maxTime: DateTime.now(), onConfirm: (date) {
                  _date =
                      '${date.day} ${months[date.month - 1]} of ${date.year}';
                  setState(() {});
                }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  $_date',
                  style: StylesText.w400s15.copyWith(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
