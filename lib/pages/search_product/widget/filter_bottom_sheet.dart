import 'package:ecommerce/pages/search_product/provider/products_provider.dart';
import 'package:ecommerce/pages/search_product/widget/clear_filters_button.dart';
import 'package:ecommerce/pages/search_product/widget/close_filters_button.dart';
import 'package:ecommerce/util/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'apply_filter_button.dart';
import 'brand_list.dart';
import 'filter_fields.dart';
import 'filter_heading.dart';

void showFilterOptions(
  BuildContext context,
  TextEditingController minPriceController,
  TextEditingController maxPriceController,
  TextEditingController minRatingController,
) {
  final provider = context.read<ProductsProvider>();
  Get.bottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      Column(
        children: [
          const SizedBox(height: 50,),
          const FilterHeading(
            name: 'Price Filters',
          ),
          FilterFields(
            hint: 'Min Price',
            icon: FontAwesomeIcons.indianRupeeSign,
            controller: minPriceController,
          ),
          FilterFields(
            hint: 'Max Price',
            icon: FontAwesomeIcons.indianRupeeSign,
            controller: maxPriceController,
          ),
          FilterFields(
            hint: 'Enter rating between 1 - 5',
            icon: FontAwesomeIcons.solidStar,
            controller: minRatingController,
          ),
          const FilterHeading(
            name: 'Brands',
          ),
          const Expanded(child: BrandList()),
          ApplyFilterButton(
            onTap: () {

              final minimumPrice = minPriceController.text;
              final maximumPrice = maxPriceController.text;
              final minimumRating = minRatingController.text;

              if (minimumPrice.isEmpty) {
                provider.setMinPrice(null);
              } else {
                int minPrice = int.tryParse(minimumPrice) ?? 0;
                provider.setMinPrice(minPrice);
              }

              if (maximumPrice.isEmpty) {
                provider.setMaxPrice(null);
              } else {
                int maxPrice = int.tryParse(maximumPrice) ?? 0;
                provider.setMaxPrice(maxPrice);
              }

              if (minimumRating.isEmpty) {
                provider.setMinRating(null);
              } else {
                int minRating = int.tryParse(minimumRating) ?? 1;
                if (minRating == 0 || minRating > 5) {
                  showToast('Please enter rating between 1 and 5', ToastGravity.TOP);
                  return;
                }
                provider.setMinRating(minRating);
              }

              String brands = "";
              final brandNames = provider.allBrands;
              if (brandNames.isNotEmpty) {
                for (int i = 0; i < brandNames.length; i++) {
                  if (brandNames[i].isSelected) {
                    final name = brandNames[i].brandName;
                    // DOESN'T ADDS COMMAS ON LAST INDEX OF TRAY NAMES AND SINGLE NAME DOESN'T HAVE COMMA
                    // COMMAS ARE ADDED IN CASE OF MULTIPLE TRAY NAMES
                    if (i == brandNames.length - 1) {
                      // Last index [No Comma] (Also works if list has only 1 item)
                      brands += "$name";
                    }
                    // ELSE ADDS COMMA
                    else {
                      brands += "$name,";
                    }
                  }
                }
              }

              if (brands.isEmpty) {
                provider.setBrands(null);
              } else {
                provider.setBrands(brands);
              }
              Get.back();
              provider.setFilterApplied();
              provider.populateData();
            },
          ),
          Row(
            children: [
              ClearFiltersButton(
                  onTap: () {
                minPriceController.text = '';
                maxPriceController.text = '';
                minRatingController.text = '';
                provider.setFilterApplied();
                provider.clearFilters();
              }),
              CloseFiltersButton(
                  onTap: () {
                    provider.setFilterApplied();
                    Get.back();
                  })
            ],
          ),

          const SizedBox(height: 15,)
        ],
      ));
}
