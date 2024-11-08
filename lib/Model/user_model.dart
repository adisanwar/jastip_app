class users {
  int? status;
  String? message;
  Data? data;

  users({this.status, this.message, this.data});

  users.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? username;
  String? password;
  String? email;
  String? token;
  String? status;
  String? role;

  Data(
      {this.id,
      this.username,
      required this.password,
      this.email,
      this.token,
      this.status,
      required this.role});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    token = json['token'];
    status = json['status'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    data['token'] = token;
    data['status'] = status;
    data['role'] = role;
    return data;
  }
}
