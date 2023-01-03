import 'package:flutter/material.dart';
import 'package:test_app/src/app_controller.dart';
import 'package:test_app/src/feature/home_page_widgets/categories_list_view.dart';
import 'package:test_app/src/localization/generated/l10n.dart';
import 'package:test_app/src/styles.dart';

import 'home_page_widgets/bottom_panel.dart';
import 'home_page_widgets/main_list_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AppController controller;

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Text(
                L10n.of(context).myCodes,
                style: AppStyles.s24w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.064,
            ),
            CategoriesListView(
              controller: widget.controller,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.054,
            ),
            MainListView(
              controller: widget.controller,
            ),
            const ButtomPanel()
          ],
        ),
      ),
    );
  }
}
