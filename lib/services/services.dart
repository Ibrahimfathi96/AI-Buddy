import 'package:chatgpt_application/constants/constants.dart';
import 'package:chatgpt_application/views/widgets/drop_down.dart';
import 'package:chatgpt_application/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class Services {
  static Future<void> showModalSheet({
    required BuildContext context,
  }) async {
    await showModalBottomSheet(
      backgroundColor: scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Flexible(
                child: TextWidget(
                  label: 'Choose Model',
                  fontSize: 16,
                ),
              ),
              Flexible(
                flex: 2,
                child: ModelDropDownWidget(),
              )
            ],
          ),
        );
      },
    );
  }
}
