import 'package:ecommerce/pages/search_product/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResultCount extends StatelessWidget {
  const SearchResultCount({super.key});

  @override
  Widget build(BuildContext context) {
    final searchQuery = context.read<ProductsProvider>().searchQuery;
    return Selector<ProductsProvider, int>(
      selector: (_, provider) => provider.productList.length,
        builder: (_, count, __) {
        return Text(
          searchQuery.isEmpty ? 'Showing $count results' :
            "$count results for '$searchQuery'"
        );
        },

    );
  }
}
