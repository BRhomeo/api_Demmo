import 'package:api_demmo/package/model/games_model.dart';

class ModelControllerGenral {
  List<GamesModel>? dataApp;

  ModelControllerGenral({this.dataApp});

  ModelControllerGenral.fromJson(dynamic json) : assert(json != null) {
    dataApp = [];
    json.forEach((value) {
      //  (dataApp != null) ? add : null
      dataApp?.add(GamesModel.fromJson(value));
    });
  }
}
