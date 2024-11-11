import 'package:jastip_app/Provider/Database/db_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderManager {
  // Fungsi untuk mengambil headers, dengan jenis content-type yang fleksibel
  static Future<Map<String, String>> getHeaders({bool isMultipart = false}) async {
    // Mengambil token dari DatabaseProvider
    String apiKey = await DatabaseProvider().getToken();

    // Menentukan header berdasarkan apakah itu multipart atau json
    if (isMultipart) {
      return {
        'X-API-TOKEN': apiKey,
        'Content-Type': 'multipart/form-data',  // Untuk upload file
      };
    } else {
      return {
        'X-API-TOKEN': apiKey,
        'Content-Type': 'application/json',  // Untuk request json biasa
      };
    }
  }
}
