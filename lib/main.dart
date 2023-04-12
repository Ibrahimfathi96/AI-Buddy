import 'package:chatgpt_application/constants/constants.dart';
import 'package:chatgpt_application/views/chat_view/chat_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatGptApplication());
}

class ChatGptApplication extends StatelessWidget {
  const ChatGptApplication({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          color: cardColor,
        ),
      ),
    );
  }
}

