import 'dart:io';

Future<bool> checkInternetConnection() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    // INTERNET AVAILABLE
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    // NO INTERNET
    else {
      return false;
    }
  } on SocketException catch (e) {
    return false;
  }
}
