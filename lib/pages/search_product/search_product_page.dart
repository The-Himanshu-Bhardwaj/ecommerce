import 'package:ecommerce/pages/search_product/provider/products_provider.dart';
import 'package:ecommerce/pages/search_product/widget/filter_bottom_sheet.dart';
import 'package:ecommerce/pages/search_product/widget/filter_icon.dart';
import 'package:ecommerce/pages/search_product/widget/products_grid.dart';
import 'package:ecommerce/pages/search_product/widget/refresh_icon.dart';
import 'package:ecommerce/pages/search_product/widget/search_field.dart';
import 'package:ecommerce/pages/search_product/widget/search_result_count.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'widget/empty_state_widget.dart';

class SearchProductPage extends StatefulWidget {
  const SearchProductPage({super.key});

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  final _searchController = TextEditingController();

  final _minPriceController = TextEditingController();
  final _maxPriceController = TextEditingController();
  final _minRatingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsProvider>().populateData();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    _minRatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: GestureDetector(
            onTap: () {
              context.read<ProductsProvider>().populateData();
            },
            child: const Text('Search Products')),
        actions: [
          RefreshIcon(onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            final provider = context.read<ProductsProvider>();
            _searchController.text = '';
            provider.setSearchQuery('');
            provider.populateData();
          })
        ],
      ),
      body: Column(
        children: [
          Consumer<ProductsProvider>(builder: (_, provider, __) {
            return SearchFiled(
              hint: 'Search',
              icon: FontAwesomeIcons.magnifyingGlass,
              controller: _searchController,
              onSubmitted: (value) {
                FocusManager.instance.primaryFocus?.unfocus();
                provider.setSearchQuery(value);
                provider.populateData();
              },
            );
          }),
          Consumer<ProductsProvider>(builder: (_, provider, __) {
            // LOADING STATE
            if (provider.isLoading) {
              return const Expanded(child: Center(child: CircularProgressIndicator()));
            }

            if (provider.noData) {
              return const EmptyStateWidget(
                message: 'No result found',
              );
            }

            // EMPTY/ERROR STATE
            if (provider.hasError) {
              return const EmptyStateWidget(
                message: 'Something went wrong',
              );
            }

            // LOADED STATE
            return Column(
              children: [
                FilterIcon(
                  onPressed: () {
                    showFilterOptions(context, _minPriceController, _maxPriceController, _minRatingController);
                  },
                ),
                const SearchResultCount(),
                ProductsGrid(list: provider.productList),

              ],
            );
          })
        ],
      ),
    );
  }
}
