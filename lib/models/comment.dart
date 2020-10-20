class Comment {
  Comment({this.id, this.createdAt, this.creatorId, this.content});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    createdAt = json['createdAt'] as DateTime;
    creatorId = json['_creator'] as String;
    content = json['content'] as String;
  }

  String id;
  DateTime createdAt;
  String creatorId;
  String content;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['_creator'] = creatorId;
    data['content'] = content;
    return data;
  }
}