import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:ecommerce/util/strings.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.brandName, required this.productTitle, required this.averageRating, required this.currentPrice, required this.productImage});

  final String brandName, productTitle, productImage;
  final double averageRating;
  final int currentPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(5),
      // color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO - LOAD IMAGE FROM NETWORK USING BASE URL
          // * Image is not loaded from network because the full path of the image url is not available *//
          // Therefore static images is used for now
          Align(
            alignment: AlignmentDirectional.center,
              child: Image.asset(SHAMPOO, height: 150,)
          ),
          Text(brandName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),),
          Text(productTitle, maxLines: 2, style: const TextStyle(fontSize: 12.5), overflow: TextOverflow.ellipsis,),
          RatingBar.readOnly(
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border,
            initialRating: averageRating,
            maxRating: 5,
          ),
          Text('₹ $currentPrice', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
        ],
      ),
    );
  }
}
