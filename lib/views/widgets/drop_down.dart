import 'package:chatgpt_application/constants/constants.dart';
import 'package:chatgpt_application/models/model.dart';
import 'package:chatgpt_application/services/api_services.dart';
import 'package:chatgpt_application/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ModelDropDownWidget extends StatefulWidget {
  const ModelDropDownWidget({super.key});

  @override
  State<ModelDropDownWidget> createState() => _ModelDropDownWidgetState();
}

class _ModelDropDownWidgetState extends State<ModelDropDownWidget> {
  String currentModel = "text-davinci-003";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelsModel>>(
      future: ApiServices.getModels(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: TextWidget(
              label: snapshot.error.toString(),
            ),
          );
        }
        return snapshot.data == null || snapshot.data!.isEmpty
            ? const SizedBox.shrink()
            : FittedBox(
                child: DropdownButton(
                  dropdownColor: scaffoldBackgroundColor,
                  iconEnabledColor: Colors.white,
                  items: List<DropdownMenuItem<String>>.generate(
                      snapshot.data!.length,
                      (index) => DropdownMenuItem(
                          value: snapshot.data![index].id,
                          child: TextWidget(
                            label: snapshot.data![index].id,
                          ))),
                  value: currentModel,
                  onChanged: (Object? value) {
                    currentModel = value.toString();
                  },
                ),
              );
      },
    );
  }
}
