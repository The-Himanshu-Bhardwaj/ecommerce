import 'dart:convert';

ProductsResponseModel productsResponseModelFromJson(String str) => ProductsResponseModel.fromJson(json.decode(str));

String productsResponseModelToJson(ProductsResponseModel data) => json.encode(data.toJson());

class ProductsResponseModel {
  final int? statusCode;
  final bool? success;
  final Data? data;
  final String? path;
  final String? message;
  final Meta? meta;

  ProductsResponseModel({
    this.statusCode,
    this.success,
    this.data,
    this.path,
    this.message,
    this.meta,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) => ProductsResponseModel(
    statusCode: json["statusCode"],
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    path: json["path"],
    message: json["message"],
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "data": data?.toJson(),
    "path": path,
    "message": message,
    "meta": meta?.toJson(),
  };
}

class Data {
  final List<Product>? products;
  final List<BrandElement>? brands;
  final List<Attribute>? attributes;
  final RatingsCounts? ratingsCounts;

  Data({
    this.products,
    this.brands,
    this.attributes,
    this.ratingsCounts,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    brands: json["brands"] == null ? [] : List<BrandElement>.from(json["brands"]!.map((x) => BrandElement.fromJson(x))),
    attributes: json["attributes"] == null ? [] : List<Attribute>.from(json["attributes"]!.map((x) => Attribute.fromJson(x))),
    ratingsCounts: json["ratingsCounts"] == null ? null : RatingsCounts.fromJson(json["ratingsCounts"]),
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "brands": brands == null ? [] : List<dynamic>.from(brands!.map((x) => x.toJson())),
    "attributes": attributes == null ? [] : List<dynamic>.from(attributes!.map((x) => x.toJson())),
    "ratingsCounts": ratingsCounts?.toJson(),
  };
}

class Attribute {
  final String? title;
  final String? code;
  final List<Value>? values;

  Attribute({
    this.title,
    this.code,
    this.values,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    title: json["title"],
    code: json["code"],
    values: json["values"] == null ? [] : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "code": code,
    "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
  };
}

class Value {
  final String? value;
  final int? productCount;

  Value({
    this.value,
    this.productCount,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    value: json["value"],
    productCount: json["productCount"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "productCount": productCount,
  };
}

class BrandElement {
  final String? id;
  final String? handle;
  final String? name;
  final int? productCount;

  BrandElement({
    this.id,
    this.handle,
    this.name,
    this.productCount,
  });

  factory BrandElement.fromJson(Map<String, dynamic> json) => BrandElement(
    id: json["id"],
    handle: json["handle"],
    name: json["name"],
    productCount: json["productCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "handle": handle,
    "name": name,
    "productCount": productCount,
  };
}

class Product {
  final String? id;
  final String? title;
  final dynamic subtitle;
  final String? description;
  final String? handle;
  final dynamic weight;
  final dynamic height;
  final dynamic width;
  final dynamic length;
  final dynamic hsCode;
  final dynamic originCountry;
  final dynamic midCode;
  final dynamic material;
  final Metadata? metadata;
  final String? createdAt;
  final String? updatedAt;
  final List<dynamic>? tags;
  final String? brandId;
  final String? status;
  final dynamic createdById;
  final dynamic productCategoryId;
  final String? thumbnail;
  final dynamic productAttributeGroupId;
  final dynamic metaTitle;
  final dynamic metaDescription;
  final ProductBrand? brand;
  final dynamic productCategory;
  final List<dynamic>? productCollections;
  final List<dynamic>? productValuesForAttribute;
  final List<Variant>? variants;
  final List<ProductImage>? productImages;
  final List<dynamic>? reviews;
  final Count? count;
  final dynamic averageRating;
  final int? priceStart;
  final dynamic priceEnd;

  Product({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.handle,
    this.weight,
    this.height,
    this.width,
    this.length,
    this.hsCode,
    this.originCountry,
    this.midCode,
    this.material,
    this.metadata,
    this.createdAt,
    this.updatedAt,
    this.tags,
    this.brandId,
    this.status,
    this.createdById,
    this.productCategoryId,
    this.thumbnail,
    this.productAttributeGroupId,
    this.metaTitle,
    this.metaDescription,
    this.brand,
    this.productCategory,
    this.productCollections,
    this.productValuesForAttribute,
    this.variants,
    this.productImages,
    this.reviews,
    this.count,
    this.averageRating,
    this.priceStart,
    this.priceEnd,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    description: json["description"],
    handle: json["handle"],
    weight: json["weight"],
    height: json["height"],
    width: json["width"],
    length: json["length"],
    hsCode: json["hs_code"],
    originCountry: json["origin_country"],
    midCode: json["mid_code"],
    material: json["material"],
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
    brandId: json["brandId"],
    status: json["status"],
    createdById: json["createdById"],
    productCategoryId: json["productCategoryId"],
    thumbnail: json["thumbnail"],
    productAttributeGroupId: json["productAttributeGroupId"],
    metaTitle: json["metaTitle"],
    metaDescription: json["metaDescription"],
    brand: json["brand"] == null ? null : ProductBrand.fromJson(json["brand"]),
    productCategory: json["productCategory"],
    productCollections: json["productCollections"] == null ? [] : List<dynamic>.from(json["productCollections"]!.map((x) => x)),
    productValuesForAttribute: json["productValuesForAttribute"] == null ? [] : List<dynamic>.from(json["productValuesForAttribute"]!.map((x) => x)),
    variants: json["variants"] == null ? [] : List<Variant>.from(json["variants"]!.map((x) => Variant.fromJson(x))),
    productImages: json["productImages"] == null ? [] : List<ProductImage>.from(json["productImages"]!.map((x) => ProductImage.fromJson(x))),
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
    count: json["_count"] == null ? null : Count.fromJson(json["_count"]),
    averageRating: json["averageRating"],
    priceStart: json["priceStart"],
    priceEnd: json["priceEnd"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "description": description,
    "handle": handle,
    "weight": weight,
    "height": height,
    "width": width,
    "length": length,
    "hs_code": hsCode,
    "origin_country": originCountry,
    "mid_code": midCode,
    "material": material,
    "metadata": metadata?.toJson(),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "brandId": brandId,
    "status": status,
    "createdById": createdById,
    "productCategoryId": productCategoryId,
    "thumbnail": thumbnail,
    "productAttributeGroupId": productAttributeGroupId,
    "metaTitle": metaTitle,
    "metaDescription": metaDescription,
    "brand": brand?.toJson(),
    "productCategory": productCategory,
    "productCollections": productCollections == null ? [] : List<dynamic>.from(productCollections!.map((x) => x)),
    "productValuesForAttribute": productValuesForAttribute == null ? [] : List<dynamic>.from(productValuesForAttribute!.map((x) => x)),
    "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x.toJson())),
    "productImages": productImages == null ? [] : List<dynamic>.from(productImages!.map((x) => x.toJson())),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
    "_count": count?.toJson(),
    "averageRating": averageRating,
    "priceStart": priceStart,
    "priceEnd": priceEnd,
  };
}

class ProductBrand {
  final String? id;
  final String? title;
  final String? description;
  final String? handle;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final String? status;
  final dynamic metadata;
  final dynamic createdById;

  ProductBrand({
    this.id,
    this.title,
    this.description,
    this.handle,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.status,
    this.metadata,
    this.createdById,
  });

  factory ProductBrand.fromJson(Map<String, dynamic> json) => ProductBrand(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    handle: json["handle"],
    image: json["image"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    deletedAt: json["deletedAt"],
    status: json["status"],
    metadata: json["metadata"],
    createdById: json["createdById"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "handle": handle,
    "image": image,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "deletedAt": deletedAt,
    "status": status,
    "metadata": metadata,
    "createdById": createdById,
  };
}

class Count {
  final int? lineItems;

  Count({
    this.lineItems,
  });

  factory Count.fromJson(Map<String, dynamic> json) => Count(
    lineItems: json["lineItems"],
  );

  Map<String, dynamic> toJson() => {
    "lineItems": lineItems,
  };
}

class Metadata {
  final String? excerpt;

  Metadata({
    this.excerpt,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    excerpt: json["excerpt"],
  );

  Map<String, dynamic> toJson() => {
    "excerpt": excerpt,
  };
}

class ProductImage {
  final String? id;
  final String? productId;
  final String? image;
  final int? order;
  final String? createdAt;
  final String? updatedAt;
  final dynamic createdById;
  final dynamic productVariantId;

  ProductImage({
    this.id,
    this.productId,
    this.image,
    this.order,
    this.createdAt,
    this.updatedAt,
    this.createdById,
    this.productVariantId,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    id: json["id"],
    productId: json["productId"],
    image: json["image"],
    order: json["order"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    createdById: json["createdById"],
    productVariantId: json["productVariantId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "image": image,
    "order": order,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "createdById": createdById,
    "productVariantId": productVariantId,
  };
}

class Variant {
  final String? id;
  final String? productId;
  final String? title;
  final String? sku;
  final dynamic barcode;
  final dynamic ean;
  final dynamic upc;
  final int? inventoryQuantity;
  final bool? allowBackOrder;
  final bool? manageInventory;
  final dynamic hsCode;
  final dynamic originCountry;
  final dynamic midCode;
  final dynamic material;
  final dynamic weight;
  final dynamic height;
  final dynamic length;
  final dynamic width;
  final int? variantRank;
  final int? price;
  final int? specialPrice;
  final dynamic specialPriceStartDate;
  final dynamic specialPriceEndDate;
  final int? inventory;
  final dynamic metadata;
  final String? createdAt;
  final dynamic deletedAt;
  final String? updatedAt;
  final String? thumbnail;
  final dynamic createdById;
  final List<dynamic>? prices;
  final int? originalPrice;
  final int? currentPrice;
  final SalePrices? salePrices;

  Variant({
    this.id,
    this.productId,
    this.title,
    this.sku,
    this.barcode,
    this.ean,
    this.upc,
    this.inventoryQuantity,
    this.allowBackOrder,
    this.manageInventory,
    this.hsCode,
    this.originCountry,
    this.midCode,
    this.material,
    this.weight,
    this.height,
    this.length,
    this.width,
    this.variantRank,
    this.price,
    this.specialPrice,
    this.specialPriceStartDate,
    this.specialPriceEndDate,
    this.inventory,
    this.metadata,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
    this.thumbnail,
    this.createdById,
    this.prices,
    this.originalPrice,
    this.currentPrice,
    this.salePrices,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    productId: json["productId"],
    title: json["title"],
    sku: json["sku"],
    barcode: json["barcode"],
    ean: json["ean"],
    upc: json["upc"],
    inventoryQuantity: json["inventoryQuantity"],
    allowBackOrder: json["allowBackOrder"],
    manageInventory: json["manageInventory"],
    hsCode: json["hsCode"],
    originCountry: json["originCountry"],
    midCode: json["midCode"],
    material: json["material"],
    weight: json["weight"],
    height: json["height"],
    length: json["length"],
    width: json["width"],
    variantRank: json["variantRank"],
    price: json["price"],
    specialPrice: json["specialPrice"],
    specialPriceStartDate: json["specialPriceStartDate"],
    specialPriceEndDate: json["specialPriceEndDate"],
    inventory: json["inventory"],
    metadata: json["metadata"],
    createdAt: json["createdAt"],
    deletedAt: json["deletedAt"],
    updatedAt: json["updatedAt"],
    thumbnail: json["thumbnail"],
    createdById: json["createdById"],
    prices: json["prices"] == null ? [] : List<dynamic>.from(json["prices"]!.map((x) => x)),
    originalPrice: json["originalPrice"],
    currentPrice: json["currentPrice"],
    salePrices: json["salePrices"] == null ? null : SalePrices.fromJson(json["salePrices"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "title": title,
    "sku": sku,
    "barcode": barcode,
    "ean": ean,
    "upc": upc,
    "inventoryQuantity": inventoryQuantity,
    "allowBackOrder": allowBackOrder,
    "manageInventory": manageInventory,
    "hsCode": hsCode,
    "originCountry": originCountry,
    "midCode": midCode,
    "material": material,
    "weight": weight,
    "height": height,
    "length": length,
    "width": width,
    "variantRank": variantRank,
    "price": price,
    "specialPrice": specialPrice,
    "specialPriceStartDate": specialPriceStartDate,
    "specialPriceEndDate": specialPriceEndDate,
    "inventory": inventory,
    "metadata": metadata,
    "createdAt": createdAt,
    "deletedAt": deletedAt,
    "updatedAt": updatedAt,
    "thumbnail": thumbnail,
    "createdById": createdById,
    "prices": prices == null ? [] : List<dynamic>.from(prices!.map((x) => x)),
    "originalPrice": originalPrice,
    "currentPrice": currentPrice,
    "salePrices": salePrices?.toJson(),
  };
}

class SalePrices {
  SalePrices();

  factory SalePrices.fromJson(Map<String, dynamic> json) => SalePrices(
  );

  Map<String, dynamic> toJson() => {
  };
}

class RatingsCounts {
  final int? the1;
  final int? the2;
  final int? the3;
  final int? the4;
  final int? the5;

  RatingsCounts({
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.the5,
  });

  factory RatingsCounts.fromJson(Map<String, dynamic> json) => RatingsCounts(
    the1: json["1"],
    the2: json["2"],
    the3: json["3"],
    the4: json["4"],
    the5: json["5"],
  );

  Map<String, dynamic> toJson() => {
    "1": the1,
    "2": the2,
    "3": the3,
    "4": the4,
    "5": the5,
  };
}

class Meta {
  final int? total;
  final int? items;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;

  Meta({
    this.total,
    this.items,
    this.perPage,
    this.currentPage,
    this.lastPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: json["total"],
    items: json["items"],
    perPage: json["perPage"],
    currentPage: json["currentPage"],
    lastPage: json["lastPage"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "items": items,
    "perPage": perPage,
    "currentPage": currentPage,
    "lastPage": lastPage,
  };
}
