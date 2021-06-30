import 'package:api_demmo/package/model/model-controller-genral.dart';

abstract class HandleApi {
  Future<ModelControllerGenral> getGames();
}
