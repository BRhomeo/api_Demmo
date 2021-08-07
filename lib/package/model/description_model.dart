class DescriptionModel {
  String? name;
  String? description;
  String? subtitle;

  DescriptionModel({this.name, this.description, this.subtitle});

  DescriptionModel.fromJson(Map<String, dynamic> json)
      : assert(json.isNotEmpty),
        name = json['displayProperties']['name'] as String,
        description = json['displayProperties']['description'] as String,
        subtitle = json['subtitle'] as String;
}
