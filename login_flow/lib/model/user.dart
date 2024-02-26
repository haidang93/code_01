class User {
  String? objectId;
  String? username;
  String? password;
  String? email;
  String? firstName;
  String? createdAt;
  String? updatedAt;
  String? sessionToken;

  User(
      {this.objectId,
      this.username,
      this.password,
      this.email,
      this.firstName,
      this.createdAt,
      this.updatedAt,
      this.sessionToken});

  User.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    username = json['username'];
    email = json['email'];

    firstName = json['firstName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sessionToken = json['sessionToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['firstName'] = firstName;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['sessionToken'] = sessionToken;
    return data;
  }
}
