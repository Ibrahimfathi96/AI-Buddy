import 'dart:convert';

import 'package:chatgpt_application/constants/api_consts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<void> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$baseUrl/models"),
        headers: {"Authorization": "Bearer $apiKey"},
      );
      Map jsonResponse = jsonDecode(response.body);
      debugPrint("jsonResponse $jsonResponse");
    } catch (ex) {
      debugPrint("error $ex");
    }
  }
}
