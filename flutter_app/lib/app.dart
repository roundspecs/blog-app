import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/theme_constants.dart';
import 'package:flutter_app/core/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Blog App',
      theme: ThemeConstants.themeData,
      routerConfig: router,
    );
  }
}