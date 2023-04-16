import 'package:chatgpt_application/models/model.dart';
import 'package:chatgpt_application/services/api_services.dart';
import 'package:flutter/material.dart';

class ModelsProvider with ChangeNotifier {
  String currentModel = 'text-davinci-003';

  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  List<ModelsModel> modlesList = [];
  List<ModelsModel> get getModelsList {
    return modlesList;
  }

  Future<List<ModelsModel>> getAllModels() async {
    modlesList = await ApiService.getModels();
    return modlesList;
  }
}
