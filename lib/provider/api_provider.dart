import 'dart:convert';

import 'package:flutter_api_provider/model/sample_model.dart';
import 'package:http/http.dart' as http;

class SampleAPI {
  Future<APIResponseModel> getDataFromAPI() async {
    final response =
    await http.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return APIResponseModel(
          statusCode: response.statusCode,
          message: 'Data Found',
          response: SampleModel.fromJSon(data));
    } else {
      return APIResponseModel(
          response: [],
          message: 'No Data Found',
          statusCode: response.statusCode);
    }
  }

  Future<APIResponseModel> postDataToAPI(
      int userId, int id, String title, String body) async {

    final http.Response response = await http.post('https://jsonplaceholder.typicode.com/posts',
      headers: <String,String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String> {
        'userId': userId.toString(),
        'id': id.toString(),
        'title': title,
        'body': body,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return APIResponseModel(
          statusCode: response.statusCode,
          message: 'Data Found',
          response: Sample.fromJSon(data));
    } else {
      return APIResponseModel(
          response: [],
          message: 'No Data Found',
          statusCode: response.statusCode);
    }
  }

}
