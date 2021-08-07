class BookModel {
  //Map? displayProperties;
  String? name;
  String? originalIcon;
  List? children;
  BookModel({this.name, this.originalIcon, this.children});

  BookModel.fromJson(Map<String, dynamic> json)
      : assert(json.isNotEmpty),
        name = json['displayProperties']['name'],
        originalIcon = json['originalIcon'] as String,
        children = json['children']['records'];
}
