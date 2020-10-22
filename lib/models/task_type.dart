class TaskType {
  TaskType({this.id, this.name});

  TaskType.fromJson(Map<String, String> json) {
    id = json['id'];
    name = json['name'];
  }

  String id;
  String name;

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
