class Project {
  String id;
  String name;
  String color;
  String userId;

  Project({this.id, this.name, this.color, this.userId});

  Project.fromJson(Map<String, String> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    userId = json['_user'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    data['_user'] = userId;
    return data;
  }
}
