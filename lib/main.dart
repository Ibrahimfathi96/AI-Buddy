import 'package:flutter/material.dart';

void main() {
  runApp(const ChatGptApplication());
}

class ChatGptApplication extends StatelessWidget {
  const ChatGptApplication({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
