import 'package:flutter/material.dart';
import 'package:jastip_app/Model/user_model.dart';
import 'package:jastip_app/Provider/Database/db_provider.dart';
import 'package:jastip_app/Services/auth_service.dart';

class AuthProvider with ChangeNotifier {

  final DatabaseProvider _dbProvider = DatabaseProvider();
  final AuthService _authService = AuthService(); // Instance from ApiService


  String? _token;
  String? _username;
  String? _email;
  int? _status;
  String? _role;
  bool _isLoading = false;
  String? _errorMessage;

  String? get token => _token;
  String? get username => _username;
  String? get email => _email;
  int? get status => _status;
  String? get role => _role;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;



  // Fungsi untuk login dan menyimpan token serta informasi pengguna
  Future<bool> login(String username, String password) async {
    try {
      _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Notify listeners about the loading state

      final response = await _authService.login(
        '/users/login', // Adjust your API endpoint here
        {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        // Parsing response data
        Users userResponse = Users.fromJson(response.data);

        // Menyimpan data pengguna dan token
        _token = userResponse.data?.token;
        _username = userResponse.data?.username;
        _email = userResponse.data?.email;
        _status = userResponse.data?.status;
        _role = userResponse.data?.role;

        // Simpan token di DatabaseProvider
        await _dbProvider.saveToken(_token!);

        // Notify listeners to update UI
        notifyListeners();
        return true;
      } else {
        return false; // Login failed
      }
    } catch (e) {
      print("Error during login: $e");
      return false;
    }
  }

  // Method to register a user
  Future<bool> register(String username, String password, String email, String role) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Notify listeners about the loading state

    try {
      final response = await _authService.register(
        '/users',
        {'username': username, 'password': password, 'email': email, 'role': role},
      );

      if (response.statusCode == 200) {
        _isLoading = false;
        notifyListeners(); // Notify listeners about the success state
        return true;
      } else {
        _errorMessage = "Registration failed. Please try again.";
        _isLoading = false;
        notifyListeners(); // Notify listeners about the error state
        return false;
      }
    } catch (e) {
      _errorMessage = "An error occurred: $e";
      _isLoading = false;
      notifyListeners(); // Notify listeners about the error state
      return false;
    }
  }


  // Fungsi untuk memuat token dari DatabaseProvider
  Future<void> loadToken() async {
    _token = await _dbProvider.getToken();
    notifyListeners();
  }

  // Fungsi untuk logout
  Future<void> logout(BuildContext context) async {
    // Clear user data
    _token = null;
    _username = null;
    _email = null;
    _status = null;
    _role = null;

    // Clear token in the database
    await _dbProvider.logOut(context);

    // Notify listeners to update UI
    notifyListeners();
  }
}
