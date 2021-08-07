import 'package:api_demmo/package/model/lore_model.dart';

abstract class HandleApi {
  Future<LoreModel> getLore({required String loreHash});
}
