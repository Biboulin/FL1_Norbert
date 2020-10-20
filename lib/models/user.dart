class User {
  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.accessToken,
      this.firebaseId,
      this.image,
      this.taskIds,
      this.projectIds});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    firstName = json['firstName'] as String;
    lastName = json['lastName'] as String;
    email = json['email'] as String;
    password = json['password'] as String;
    accessToken = json['access_token'] as String;
    firebaseId = json['firebaseId'] as String;
    image = json['image'] as String;
    if (json['_tasks'] != null) {
      taskIds = <String>[];
      json['_tasks'].forEach((String v) {
        taskIds.add(v);
      });
    }
    if (json['_projects'] != null) {
      projectIds = <String>[];
      json['_projects'].forEach((String v) {
        projectIds.add(v);
      });
    }
  }

  String id;
  String firstName;
  String lastName;
  String email;
  String password;
  String accessToken;
  String firebaseId;
  String image;
  List<String> taskIds;
  List<String> projectIds;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['access_token'] = accessToken;
    data['firebaseId'] = firebaseId;
    data['image'] = image;
    if (taskIds != null) {
      data['_tasks'] = taskIds.map((String v) => v).toList();
    }
    if (projectIds != null) {
      data['_projects'] = projectIds.map((String v) => v).toList();
    }
    return data;
  }
}