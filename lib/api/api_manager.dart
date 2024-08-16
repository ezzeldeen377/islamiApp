import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islamic_app/api/api_constants.dart';
import 'package:islamic_app/model/RadioResponse.dart';


class ApiManager {

   static Future<RadioResponse> getFromApi(String languageCode) async {
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.apiName,
      {
        'language':languageCode
      }
    );
    var response = await http.get(url);
    try{
      return RadioResponse.fromJson(jsonDecode(response.body));
    }catch (e){
      rethrow ;

    }
  }
}