
import 'package:ecommerce/pages/search_product/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../util/app_colors.dart';

class BrandList extends StatelessWidget {
  const BrandList({super.key});


  @override
  Widget build(BuildContext context) {

    final provider = context.watch<ProductsProvider>();
    final brandList = provider.allBrands;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4,
      ),
      itemCount: brandList.length,
      itemBuilder: (context, index) {

        final brandName = brandList[index].brandName;
        final isSelected = brandList[index].isSelected;

        return GestureDetector(
          onTap: () {
            if (isSelected) {
              provider.changeBrandSelection(index, false);
            } else {
              provider.changeBrandSelection(index, true);
            }
          },

          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isSelected ? const Color(AppColors.DARK_BLUE) :
                const Color(AppColors.MEDIUM_GREY)
            ),
            child: Text(brandName!, style: TextStyle(
                color: isSelected ? Colors.white : null
            ),),
          ),
        );
      },
    );
  }
}
