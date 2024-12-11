import 'dart:convert';

import 'package:ecommerce/pages/search_product/model/products_response_model.dart';
import 'package:ecommerce/util/api_endpoint_names.dart';
import 'package:ecommerce/util/show_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../../util/app_constants.dart';
import '../../../util/check_internet.dart';
import '../../../util/strings.dart';

class ProductsRepo {

  Future<ProductsResponseModel> populateData(String searchQuery, String? brands, int? minPrice, int? maxPrice, int? minimumRating) async {

    // Checking internet first
    final internetConnected = await checkInternetConnection();
    if (!internetConnected) {
      showToast('No internet', ToastGravity.BOTTOM);
      throw Exception(NO_INTERNET_MESSAGE);
    }

    try {
      final url = Uri.parse('${AppConstants.getApiUrl(SEARCH_PRODUCT)}?q=$searchQuery&brand=$brands&minPrice=$minPrice&maxPrice=$maxPrice&minRating=$minimumRating');

      final response = await http.get(url).timeout(const Duration(seconds: 30), onTimeout: () {
        return http.Response('Error', 408);
      });

      // WHEN RESPONSE BODY IS BLANK
      if (response.body.isEmpty) {
        throw Exception(EMPTY_RESPONSE_MESSAGE);
      }

      // Response Success
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final responseData = ProductsResponseModel.fromJson(data);
        return responseData;
      }

      // Timeout error
      else if (response.statusCode == 408) {
        throw Exception(API_TIMEOUT_MESSAGE);
      }

      // Any other status code
      else {
        throw Exception('Code (${response.statusCode}) Failed to load data');
      }
    }

    catch (e) {
      throw Exception(e.toString());
    }
  }

}