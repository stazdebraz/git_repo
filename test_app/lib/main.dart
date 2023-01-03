import 'package:flutter/material.dart';
import 'package:test_app/src/app_controller.dart';
import 'package:test_app/src/api/api_service.dart';

import 'src/app.dart';

void main() async {
  final appController = AppController(apiService: ApiService());
  await appController.loadData();
  runApp(MyApp(
    appController: appController,
  ));
}
