import 'package:chatgpt_application/constants/constants.dart';
import 'package:chatgpt_application/models/chat_model.dart';
import 'package:chatgpt_application/providers/models_provider.dart';
import 'package:chatgpt_application/services/api_services.dart';
import 'package:chatgpt_application/services/assets_manager.dart';
import 'package:chatgpt_application/services/services.dart';
import 'package:chatgpt_application/views/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isTyping = false;
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

  List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
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
        title: const Text('AI Buddy'),
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
                  chatIndex: chatList[index].chatIndex,
                  msg: chatList[index].msg,
                ),
                itemCount: chatList.length,
              ),
            ),
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                size: 18,
                color: Colors.white,
              ),
            ],
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
                          await sendMessageFCT(modelsProvider: modelsProvider);
                        },
                        decoration: const InputDecoration.collapsed(
                          hintText: 'How Can I Help You?',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await sendMessageFCT(modelsProvider: modelsProvider);
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendMessageFCT({required ModelsProvider modelsProvider}) async {
    try {
      setState(() {
        _isTyping = true;
      });
      chatList = await ApiService.sendMessage(
          message: textEditingController.text,
          modelId: modelsProvider.getCurrentModel);
      setState(() {});
    } catch (ex) {
      debugPrint("error $ex");
    } finally {
      setState(() {
        _isTyping = false;
      });
    }
  }
}
