import 'package:flutter/material.dart';
import 'package:jastip_app/Screens/Auth/login.dart';
import 'package:jastip_app/Utils/routers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseProvider extends ChangeNotifier {
  // Menggunakan singleton pattern agar DatabaseProvider bisa diakses di mana saja
  static final DatabaseProvider _instance = DatabaseProvider._internal();
  factory DatabaseProvider() => _instance;
  DatabaseProvider._internal();

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  String _token = '';
  String _userId = '';

  String get token => _token;
  String get userId => _userId;

  // Method untuk menyimpan token ke SharedPreferences
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await _pref;
    await prefs.setString('token', token);
    _token = token;
    notifyListeners();
  }

  // Method untuk menyimpan userId ke SharedPreferences
  Future<void> saveUserId(String id) async {
    SharedPreferences prefs = await _pref;
    await prefs.setString('id', id);
    _userId = id;
    notifyListeners();
  }

  // Method untuk mengambil token dari SharedPreferences
  Future<String> getToken() async {
    SharedPreferences prefs = await _pref;
    if (prefs.containsKey('token')) {
      _token = prefs.getString('token')!;
      notifyListeners();
      return _token;
    } else {
      _token = '';
      notifyListeners();
      return '';
    }
  }

  // Method untuk mengambil userId dari SharedPreferences
  Future<String> getUserId() async {
    SharedPreferences prefs = await _pref;
    if (prefs.containsKey('id')) {
      _userId = prefs.getString('id')!;
      notifyListeners();
      return _userId;
    } else {
      _userId = '';
      notifyListeners();
      return '';
    }
  }

  // Method untuk logout, membersihkan semua data dari SharedPreferences
  Future<void> logOut(BuildContext context) async {
    SharedPreferences prefs = await _pref;
    await prefs.clear();

    // Navigasi ke halaman login
    PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
  }
}
