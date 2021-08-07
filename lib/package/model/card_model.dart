class CardModel {
  String? name;
  String? originalIcon;
  int? loreHash;
  CardModel({this.name, this.originalIcon, this.loreHash});

  CardModel.fromJson(Map<String, dynamic> json)
      : assert(json.isNotEmpty),
        name = json['displayProperties']['name'] as String,
        originalIcon = json['displayProperties']['icon'] as String,
        loreHash = json['loreHash'] as int;
}
