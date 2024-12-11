import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'pages/search_product/provider/products_provider.dart';
import 'pages/search_product/search_product_page.dart';
import 'util/strings.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductsProvider()),
    ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: SANS_REGULAR, useMaterial3: true),
      home: const SearchProductPage(),
    ),
  ));
}

