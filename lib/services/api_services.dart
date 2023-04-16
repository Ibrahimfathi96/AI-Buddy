import 'dart:convert';
import 'dart:io';
import 'package:chatgpt_application/constants/api_consts.dart';
import 'package:chatgpt_application/models/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$baseUrl/models"),
        headers: {"Authorization": "Bearer $apiKey"},
      );
      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        debugPrint(jsonResponse['error']['message']);
        throw HttpException(jsonResponse['error']['message']);
      }
      debugPrint("jsonResponse $jsonResponse");
      List temp = [];
      for (var value in jsonResponse['data']) {
        temp.add(value);
        debugPrint("temp ${value["id"]}");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (ex) {
      debugPrint("error $ex");
      rethrow;
    }
  }
}
