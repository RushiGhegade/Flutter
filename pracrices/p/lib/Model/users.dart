class Users {
  Users({
    required this.image,
    required this.isActive,
    required this.name,
    required this.about,
    required this.createdAt,
    required this.id,
    required this.lastActive,
    required this.pushToken,
    required this.email,
  });
  late String image;
  late bool isActive;
  late String name;
  late String about;
  late String createdAt;
  late String id;
  late String lastActive;
  late String pushToken;
  late String email;

  Users.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    isActive = json['is_active'] ?? false;
    name = json['name'] ?? '';
    about = json['about'] ?? '';
    createdAt = json['created_at'] ?? '';
    id = json['id'] ?? "";
    lastActive = json['last_active'] ?? '';
    pushToken = json['push_token'] ?? '';
    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['is_active'] = isActive;
    data['name'] = name;
    data['about'] = about;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['last_active'] = lastActive;
    data['push_token'] = pushToken;
    data['email'] = email;
    return data;
  }
}
