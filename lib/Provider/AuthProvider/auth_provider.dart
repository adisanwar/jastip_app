import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'app_url.dart'; // Pastikan untuk import AppUrl
import 'package:jastip_app/Model/user_model.dart'; // Import model Data untuk response login
// Import model Data untuk response login

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _username;
  String? _email;
  int? _status;
  String? _role;

  String? get token => _token;
  String? get username => _username;
  String? get email => _email;
  int? get status => _status;
  String? get role => _role;

  // Fungsi untuk login dan menyimpan token serta informasi pengguna
  Future<bool> login(String username, String password) async {
    try {
      final dio = Dio();

      // Melakukan request POST ke endpoint login menggunakan AppUrl.login
      final response = await dio.post(
        'http://192.168.1.2:3000/api/users/login', // Menggunakan URL dari AppUrl
        data: {
          'username': username,
          // 'email': email,
          'password': password,
        },
      );

      // Mengecek apakah statusCode-nya 200 (berhasil)
      if (response.statusCode == 200) {
        // Parsing dan menyimpan data dari response
        Data authResponse = Data.fromJson(response.data);

        // Menyimpan data pengguna dan token
        _token = authResponse.token;
        _username = authResponse.username;
        _email = authResponse.email;
        _status = authResponse.status;
        _role = authResponse.role;

        // Memberitahukan listeners untuk update UI
        notifyListeners();
        return true;
      } else {
        return false; // Jika statusCode tidak 200, login gagal
      }
    } catch (e) {
      // Menangani error jika terjadi
      print("Error during login: $e");
      return false;
    }
  }

  // Fungsi untuk logout
  Future<void> logout() async {
    _token = null;
    _username = null;
    _email = null;
    _status = null;
    _role = null;
    notifyListeners();
  }
}
