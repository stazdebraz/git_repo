// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'api/api_model.dart';
import 'api/api_service.dart';

class AppController with ChangeNotifier {
  AppController({
    required this.apiService,
  });
  final ApiService apiService;
  int currentIndex = 0;

  late ApiModel items;
  Future<void> loadData() async {
    items = await apiService.getData();
    notifyListeners();
  }

  Future<void> selectCategory(int index) async {
    currentIndex = index;
    notifyListeners();
  }
}
