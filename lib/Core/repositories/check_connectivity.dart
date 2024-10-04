import 'dart:async';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashRepository extends GetConnect {

  Future<bool> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    } else {
      try {
        final response = await get('https://www.google.com', ).timeout(const Duration(seconds: 5));
        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      } on TimeoutException catch (_) {
        return false;
      } catch (e) {
        return false;
      }
    }
  }
}
