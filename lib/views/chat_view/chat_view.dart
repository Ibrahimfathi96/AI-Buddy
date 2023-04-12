import 'dart:developer';

import 'package:chatgpt_application/constants/constants.dart';
import 'package:chatgpt_application/services/api_services.dart';
import 'package:chatgpt_application/services/assets_manager.dart';
import 'package:chatgpt_application/services/services.dart';
import 'package:chatgpt_application/views/widgets/chat_widget.dart';
import 'package:chatgpt_application/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bool _isTyping = true;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await Services.showModalSheet(context: context);
              },
              icon: const Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              ))
        ],
        elevation: 2,
        title: const Text('ChatGPT'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.openaiLogo),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ChatWidget(
                  chatIndex:
                      int.parse(chatMessages[index]['chatIndex'].toString()),
                  msg: chatMessages[index]['msg'].toString(),
                ),
                itemCount: 6,
              ),
            ),
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                size: 18,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: textEditingController,
                          onSubmitted: (value) async {
                            try {
                              await ApiServices.getModels();
                            } on Exception catch (e) {
                              debugPrint(" $e");
                            }
                          },
                          decoration: const InputDecoration.collapsed(
                            hintText: 'How Can I Help You?',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
