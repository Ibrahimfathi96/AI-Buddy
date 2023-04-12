import 'package:chatgpt_application/constants/constants.dart';
import 'package:chatgpt_application/services/assets_manager.dart';
import 'package:chatgpt_application/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  AssetsManager.userImage,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 8,
                ),
                const TextWidget(
                  label: 'Hello,Here is the our coming message',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
