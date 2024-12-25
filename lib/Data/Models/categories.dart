class Categories{
  int? id;
  String? name;
  Categories.fromJson(dynamic json){
    id=json["id"];
    name=json["name"];
  }
}