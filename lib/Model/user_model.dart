class Users {
  int? status;
  String? message;
  Data? data;

  Users({this.status, this.message, this.data});

  Users.fromJson(Map<String, dynamic> json) {
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
  int? status; // Ensure `bool?` is correctly used for nullable boolean values
  String? role;

  Data(
      {this.id,
      this.username,
      required this.password,
      this.email,
      this.token,
      this.status, // Keep `bool? status` if it can be null, otherwise remove the `?` for non-nullable
      required this.role});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    email = json['email'];
    token = json['token'];
    status = json['status']; // Ensure `status` is correctly mapped
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
