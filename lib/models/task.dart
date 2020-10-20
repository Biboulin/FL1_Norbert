class Task {
  String id;
  String title;
  String description;
  String color;
  List<Item> items;
  String image;
  DateTime dueDate;
  bool isDone;
  String userId;
  String typId;
  List<String> attachedUserIds;
  String attachedProjectId;
  List<String> commentIds;

  Task({
    this.id,
    this.title,
    this.description,
    this.color,
    this.items,
    this.image,
    this.dueDate,
    this.isDone,
    this.userId,
    this.typId,
    this.attachedUserIds,
    this.attachedProjectId,
    this.commentIds
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    title = json['title'] as String;
    description = json['description'] as String;
    color = json['color'] as String;
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((Map<String, dynamic> v) {
        items.add(Item.fromJson(v));
      });
    }
    image = json['image'] as String;
    dueDate = json['dueDate'] as DateTime;
    isDone = json['isDone'] as bool;
    userId = json['_user'] as String;
    typId = json['_type'] as String;
    attachedUserIds = json['_forUser'].cast<String>() as List<String>;
    attachedProjectId = json['_forProject'] as String;
    commentIds = json['_comments'].cast<String>() as List<String>;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['color'] = color;
    if (items != null) {
      data['items'] = items.map((Item v) => v.toJson()).toList();
    }
    data['image'] = image;
    data['dueDate'] = dueDate;
    data['isDone'] = isDone;
    data['_user'] = userId;
    data['_type'] = typId;
    data['_forUser'] = attachedUserIds;
    data['_forProject'] = attachedProjectId;
    data['_comments'] = commentIds;
    return data;
  }
}

class Item {
  String title;
  bool done;

  Item({this.title, this.done});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String;
    done = json['done'] as bool;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['done'] = done;
    return data;
  }
}
