import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtils {
  // Fungsi untuk memeriksa koneksi internet
  static Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}