class AppConstants {
  static const BASE_URL = 'https://bb3-api.ashwinsrivastava.com/';
  static String getApiUrl(String apiEndpoint) {
    return '$BASE_URL/$apiEndpoint';
  }
}