import 'package:flutter/material.dart';

import '../../../util/get_null_safe_data.dart';
import '../model/products_response_model.dart';
import 'product_widget.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key, required this.list});

  final List<Product> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {

          final productTitle = getNullSafeString(list[index].title, '');
          String brand = '';
          if (list[index].brand != null) {
            brand = getNullSafeString(list[index].brand!.title, '');
          }
          final productThumbnail = getNullSafeString(list[index].thumbnail, '');
          final averageRating = getNullSafeDouble(list[index].averageRating, 0);
          final currentPrice = getNullSafeInt(list[index].priceStart, 0);

          return ProductWidget(
            productTitle: productTitle,
            brandName: brand,
            productImage: productThumbnail,
            averageRating: averageRating,
            currentPrice: currentPrice,
          );
        },
      ),
    );
  }
}
