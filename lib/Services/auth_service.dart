import 'package:dio/dio.dart';
import 'package:jastip_app/Constant/urls.dart';
import 'package:jastip_app/Utils/header_manager.dart';
import 'package:jastip_app/Utils/network_check.dart';  // Import HeaderManager

class AuthService {
  final Dio _dio = Dio();

  // Constructor to set the base URL for the Dio instance
  AuthService() {
    _dio.options.baseUrl = Appurl.baseUrl;
  }

 Future<Response> login(String endpoint, Map<String, dynamic> data) async {
  try {
    // Gunakan fungsi general untuk memeriksa koneksi
    // bool hasConnection = await NetworkUtils.isConnected();
    // if (!hasConnection) {
    //   throw Exception("No internet connection");
    // }

    // Ensure content-type is set for JSON if needed
    final options = Options(
      headers: {'Content-Type': 'application/json'},  // Ensure correct Content-Type header
    );

    // Request POST ke endpoint login
    final response = await _dio.post(
      endpoint,
      data: data,
      options: options,  // Add the options with headers
    );

    return response;
  } catch (e) {
    print("Error during login: $e");
    rethrow;
  }
}

Future<Response> register(String endpoint, Map<String, dynamic> data) async {
  try {
    // Fetch headers using the HeaderManager
    // Map<String, String> headers = await HeaderManager.getHeaders();

    // Set the options with the headers
    final options = Options(
      headers: {'Content-Type': 'application/json'}, // Pass the headers from HeaderManager
    );

    // Make the POST request to the provided endpoint
    final response = await _dio.post(
      endpoint,
      data: data,
      options: options, // Include options with headers
    );

    return response;
  } catch (e) {
    print("Error during registration: $e");
    rethrow; // Rethrow the exception to be handled elsewhere
  }
}
  // Fungsi untuk melakukan GET request
  Future<Response> getData(String endpoint) async {
    try {
      // Mendapatkan headers dari HeaderManager
      Map<String, String> headers = await HeaderManager.getHeaders();

      // Menambahkan header ke dalam request
      final response = await _dio.get(
        endpoint,
        options: Options(headers: headers), // Menggunakan header yang sudah diambil
      );
      return response;
    } catch (e) {
      print("Error during GET request: $e");
      rethrow;
    }
  }

  // Fungsi untuk upload file (Multipart)
  Future<Response> uploadFile(String endpoint, FormData formData) async {
    try {
      // Mendapatkan headers dari HeaderManager untuk multipart
      Map<String, String> headers = await HeaderManager.getHeaders(isMultipart: true);

      // Menambahkan header ke dalam request
      final response = await _dio.post(
        endpoint,
        data: formData,
        options: Options(headers: headers), // Menggunakan header yang sudah diambil
      );
      return response;
    } catch (e) {
      print("Error during file upload: $e");
      rethrow;
    }
  }
}
