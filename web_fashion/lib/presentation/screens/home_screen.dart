import 'package:flutter/material.dart';
import 'package:web_fashion/presentation/screens/body_screen.dart';
import 'package:web_fashion/presentation/widgets/my_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: BodyScreen(),
    );
  }
}