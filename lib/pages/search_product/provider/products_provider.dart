import 'package:ecommerce/pages/search_product/model/brand_model.dart';
import 'package:ecommerce/pages/search_product/repo/products_repo.dart';
import 'package:flutter/material.dart';

import '../model/products_response_model.dart';

class ProductsProvider extends ChangeNotifier {

  bool _isLoading = true;
  bool _hasError = false;
  bool _noData = false;
  String _searchQuery = '';
  String? _brands;
  int? _minPrice;
  int? _maxPrice;
  int? _minRating;
  bool _filterApplied = false;
  final List<Product> _productList = [];
  final List<BrandModel> _allBrands = [];

  List<Product> get productList => _productList;
  List<BrandModel> get allBrands => _allBrands;
  bool get hasError => _hasError;
  bool get isLoading => _isLoading;
  bool get noData => _noData;
  String get searchQuery => _searchQuery;
  bool get filterApplied => _filterApplied;

  // Changes the color of filter icon if at least one filter is applied
  void setFilterApplied() {
    if (_minPrice != null || _maxPrice != null || _minRating != null || (_brands != null)) {
      _filterApplied = true;
    }
    else {
      _filterApplied = false;
    }
    notifyListeners();

  }

  void setSearchQuery(String newSearchValue) {
    _searchQuery = newSearchValue;
  }

  void setBrands(String? brandNames) {
    _brands = brandNames;

  }

  // Changes the color of a brand that is selected in the filters option
  void changeBrandSelection(int index, bool value) {
    _allBrands[index].isSelected = value;
    notifyListeners();
  }

  void setMinPrice(int? price) {
    _minPrice = price;
  }

  void setMaxPrice(int? price) {
    _maxPrice = price;
  }

  void setMinRating(int? rating) {
    _minRating = rating;
  }

  void clearFilters() {
    setMinPrice(null);
    setMaxPrice(null);
    setMinRating(null);
    setBrands(null);
    for (final model in _allBrands) {
      model.isSelected = false;
    }
    notifyListeners();
  }
  
  void populateData() async {
    try {
      _isLoading = true;
      _hasError = false;
      _noData = false;
      notifyListeners();
      final repo = ProductsRepo();
      final response = await repo.populateData(_searchQuery, _brands, _minPrice, _maxPrice, _minRating);
      if (response.data!.products!.isNotEmpty) {
        final products = response.data!.products;
        _productList.addAll(products!);
        _loadAllBrands(products);
      }
      else {
        _noData = true;
      }
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Loads all brand names, these are shown in filter
  void _loadAllBrands(List<Product> products) {
    final List<String> brandIds = [];
    for (final model in products) {
      if (model.brand != null) {
        final brandName = model.brand!.title;
        final brandId = model.brandId;
        if (brandName != null && brandId != null) {
          if (brandIds.contains(brandId)) {
            continue;
          } else {
            _allBrands.add(BrandModel(brandId, brandName, false));
            brandIds.add(brandId);
          }
        }
      }
    }
    brandIds.clear();
  }



}