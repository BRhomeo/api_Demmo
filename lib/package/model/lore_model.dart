class LoreModel {
  Map? displayProperties;
  String? originalIcon;
  List? children;
  LoreModel({this.displayProperties, this.originalIcon, this.children});

  LoreModel.fromJson(Map<String, dynamic> json)
      : assert(json.isNotEmpty),
        displayProperties = json['displayProperties'],
        originalIcon = json['originalIcon'],
        children = json['children']['presentationNodes'];
}
