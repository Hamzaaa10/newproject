class ServiceModel {
  String? id;
  String? name;
  String? description;
  String? color;
  
  ServiceModel({this.id, this.name, this.description , this.color});

  ServiceModel.fromJson(Map map) {
    id = map['id'].toString();
    name = map['name'];
    description = map['address'];
    color = map['color'];

  }
}
