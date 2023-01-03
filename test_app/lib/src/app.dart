import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_app/src/app_controller.dart';
import 'package:test_app/src/localization/generated/l10n.dart';

import 'feature/home_page_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appController,
  }) : super(key: key);
  final AppController appController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          locale: const Locale('ru'),
          supportedLocales: L10n.delegate.supportedLocales,
          localizationsDelegates: const [
            L10n.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(fontFamily: 'Roboto'),
          darkTheme: ThemeData.dark(),
          home: HomePageView(
            key: key,
            controller: appController,
          ),
        );
      },
    );
  }
}
