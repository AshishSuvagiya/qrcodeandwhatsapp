import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class ApiService {
  Future<Yeay> getdata([String? value, int? limit]) async {
    final data = await http.post(
      Uri.parse("https://yeay-dev.xc.io/search"),
      body: jsonEncode(
        {
          "searchText": value,
          "pageIndex": limit,
          "limit": 10,
          "returnQueryCount": false
        },
      ),
      headers: {"Content-Type": "application/json; charset=utf-8"},
    );
    if (kDebugMode) {
      print(data.body);
    }
    return yeayFromJson(data.body);
  }
}
