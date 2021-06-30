class GamesModel {
  String? named;
  String? image;
  String? id;

  GamesModel({this.named, this.image, this.id});

//!get data
  GamesModel.fromJson(Map<String, dynamic> json)
      : assert(json.isNotEmpty),
        named = json['named'],
        image = json['image'],
        id = json['id'];

//! Send Data
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['named'] = this.named;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}
