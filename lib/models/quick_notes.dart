class QuickNotes {
  QuickNotes(
      {this.id,
      this.description,
      this.color,
      this.userId,
      this.type,
      this.items,
      this.createdAt});

  QuickNotes.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    description = json['description'] as String;
    color = json['color'] as String;
    type = json['type'] as String;
    userId = json['_user'] as String;
    createdAt = json['createAt'] as DateTime;
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((Map<String, dynamic> v) {
        items.add(Item.fromJson(v));
      });
    }
  }

  String id;
  String description;
  String color;
  String userId;
  String type;
  DateTime createdAt;
  List<Item> items;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['color'] = color;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['_user'] = userId;
    if (items != null) {
      data['items'] = items.map((Item v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  Item({this.title, this.done});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String;
    done = json['done'] as bool;
  }

  String title;
  bool done;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['done'] = done;
    return data;
  }
}
