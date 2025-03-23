import 'dart:convert';

import 'package:baitap_laptrinhtbdd/baitap_tuan4.dart/thuchanh2/task_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Task>> fetchListData() async {
    try {
      final response =
          await http.get(Uri.parse('https://amock.io/api/researchUTH/tasks'));
      final decodedJson = jsonDecode(response.body); // Decode the response body
      final List<dynamic> dataList = decodedJson['data'];

      return dataList.map<Task>((item) => Task.fromJson(item)).toList();
    } catch (e) {
      print(e);
      throw Exception('Failed to load data from API $e');
    }
  }

  Future<Task> fetchDataDetail(int id) async {
    final response =
        await http.get(Uri.parse('https://amock.io/api/researchUTH/task/$id'));
    if (response.statusCode == 200) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
