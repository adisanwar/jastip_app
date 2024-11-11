import 'package:dio/dio.dart';
import 'package:jastip_app/Constant/urls.dart';
import 'package:jastip_app/Utils/header_manager.dart';  // Import HeaderManager

class AuthService {
  final Dio _dio = Dio();

  // Constructor to set the base URL for the Dio instance
  AuthService() {
    _dio.options.baseUrl = Appurl.baseUrl;
  }

 // Fungsi untuk melakukan POST request login tanpa x-api-key
  Future<Response> login(String endpoint, Map<String, dynamic> data) async {
    try {
      // Ensure content-type is set for JSON if needed
      final options = Options(
        headers: {'Content-Type': 'application/json'},  // Ensure correct Content-Type header
      );

      // Print out the request data for debugging
      print("Request data: $data");

      // Request POST ke endpoint login
      final response = await _dio.post(
        endpoint,
        data: data,
        options: options,  // Add the options with headers
      );

      // Print the response for debugging
      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");

      return response;
    } catch (e) {
      print("Error during login: $e");
      rethrow;
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
