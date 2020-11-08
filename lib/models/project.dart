class Project {
  Project({this.id, this.name, this.color, this.userId});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    color = json['color'] as String;
    userId = json['_user'] as String;
  }

  String id;
  String name;
  String color;
  String userId;

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    data['_user'] = userId;
    return data;
  }
}
