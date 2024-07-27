import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashRepository{

  Future<bool> checkConnectivity() async {



    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      /// No network connection.
      return true;
    } else {
      /// Connected to a network (Wi-Fi or mobile).
      try {
        final response = await http.get(Uri.parse('https://www.google.com')).timeout(const Duration(seconds: 5));
        if (response.statusCode == 200) {
          /// Internet connection is available.
           return true;
        } else {
          /// Connected to a network but no internet access.
          return true;
        }
      } on TimeoutException catch (_) {
        /// Request timed out (considered as no internet access).
        return true;
      } catch (e) {
        /// Other errors.
        return true;
      }
    }
  }
}