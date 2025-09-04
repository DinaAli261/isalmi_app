import 'package:flutter/material.dart';

import '../intro/intro_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onBackToIntro(BuildContext context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const IntroScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () => _onBackToIntro(context),
        child: const Text('Back to Introduction'),
      ),
    );
  }
}
