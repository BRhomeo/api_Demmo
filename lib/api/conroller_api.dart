import 'dart:convert';

import 'package:api_demmo/api/end_point.dart';
import 'package:api_demmo/api/handel_api.dart';
import 'package:api_demmo/package/model/book_model.dart';
import 'package:api_demmo/package/model/card_model.dart';
import 'package:api_demmo/package/model/description_model.dart';
import 'package:api_demmo/package/model/lore_model.dart';
import 'package:http/http.dart' as http;

class ContrillerApi extends HandleApi {
  int timeOut = 150;
  Map<String, String> headersGlobal = {
    "Content-Type": "application/json",
    "X-API-KEY": "885c4899d33444b4a43740264e49351b",
  };

  Future<LoreModel> getLore({required String loreHash}) async {
    String url = EndPoint.baseUrl + EndPoint.games + loreHash;
    Uri _url = Uri.parse(url);

    late LoreModel obj;
    try {
      await http
          .get(_url, headers: headersGlobal)
          .timeout(Duration(seconds: timeOut))
          .then((value) {
        //! if there is an error
        if (value.statusCode == 200) {
          var json = jsonDecode(value.body);

          obj = LoreModel.fromJson(json['Response']);

          obj.children?.forEach((element) {
            //  print(element['presentationNodeHash']);
          });
        } else {
          throw Exception('No data');
        }
      });
    } catch (e) {
      print(" general Error :  $e");
    }
    return obj;
  }

  Future<BookModel> getBook({required String bookHash}) async {
    String url = EndPoint.baseUrl + EndPoint.games + bookHash;
    Uri _url = Uri.parse(url);

    late BookModel obj;
    try {
      await http
          .get(_url, headers: headersGlobal)
          .timeout(Duration(seconds: timeOut))
          .then((value) {
        //! if there is an error
        if (value.statusCode == 200) {
          var json = jsonDecode(value.body);

          obj = BookModel.fromJson(json['Response']);
        } else {
          throw Exception('No data');
        }
      });
    } catch (e) {
      print(" general Error :  $e");
    }
    return obj;
  }

  Future<CardModel> getCard({required String cardHash}) async {
    String url = EndPoint.baseUrl + EndPoint.card + cardHash;
    Uri _url = Uri.parse(url);
    late CardModel obj;
    try {
      await http
          .get(_url, headers: headersGlobal)
          .timeout(Duration(seconds: timeOut))
          .then((value) {
        //! if there is an error
        if (value.statusCode == 200) {
          var json = jsonDecode(value.body);

          obj = CardModel.fromJson(json['Response']);
        } else {
          throw Exception('No data');
        }
      });
    } catch (e) {
      print(" general Error :  $e");
    }
    return obj;
  }

  Future<DescriptionModel> getDescription({required String hash}) async {
    String url = EndPoint.baseUrl + EndPoint.description + hash;
    Uri _url = Uri.parse(url);

    late DescriptionModel obj;
    try {
      await http
          .get(_url, headers: headersGlobal)
          .timeout(Duration(seconds: timeOut))
          .then((value) {
        //! if there is an error
        if (value.statusCode == 200) {
          var json = jsonDecode(value.body);

          obj = DescriptionModel.fromJson(json['Response']);
        } else {
          throw Exception('No data');
        }
      });
    } catch (e) {
      print(" general Error :  $e");
    }
    return obj;
  }
}
