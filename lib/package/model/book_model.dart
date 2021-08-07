class BookModel {
  Map? displayProperties;
  String? originalIcon;
  List? children;
  BookModel({this.displayProperties, this.originalIcon, this.children});

  BookModel.fromJson(Map<String, dynamic> json)
      : assert(json.isNotEmpty),
        displayProperties = json['displayProperties'],
        originalIcon = json['originalIcon'].toString(),
        children = json['children']['records'];
}
