
import 'package:flutter/material.dart';
import 'package:web_fashion/presentation/screens/home_screen.dart';
import 'package:web_fashion/presentation/widgets/utils/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.theme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}