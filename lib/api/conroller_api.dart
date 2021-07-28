import 'dart:convert';

import 'package:api_demmo/api/end_point.dart';
import 'package:api_demmo/api/handel_api.dart';
import 'package:api_demmo/package/model/model-controller-genral.dart';
import 'package:http/http.dart' as http;

class ContrillerApi extends HandleApi {
  int timeOut = 100;
  Map<String, String> headersGlobal = {"Content-Type": "application/json"};
  @override
  Future<ModelControllerGenral> getGames() async {
    String url = EndPoint.baseUrl + EndPoint.games;
    Uri _url = Uri.parse(url);

    late ModelControllerGenral _data;
    try {
      await http
          .get(_url, headers: headersGlobal)
          .timeout(Duration(seconds: timeOut))
          .then((value) {
        //! if there is an error
        if (value.statusCode == 200) {
          var json = jsonDecode(value.body);
          print(json);
          _data = ModelControllerGenral.fromJson(json);
        } else {
          throw Exception('No data');
        }
        print('then');
      });
      print(' after then');
    } catch (e) {
      print(" general Error :  $e");
    }
    return _data;
  }
}
