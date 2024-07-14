import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/theme_constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      theme: ThemeConstants.themeData,
      home: const Placeholder(),
    );
  }
}