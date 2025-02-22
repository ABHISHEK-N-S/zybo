// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
    int? id;
    Product? product;
    Category? category;
    String? name;
    String? image;
    int? showingOrder;
    bool? isActive;

    BannerModel({
        this.id,
        this.product,
        this.category,
        this.name,
        this.image,
        this.showingOrder,
        this.isActive,
    });

    factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"],
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        name: json["name"],
        image: json["image"],
        showingOrder: json["showing_order"],
        isActive: json["is_active"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product": product?.toJson(),
        "category": category?.toJson(),
        "name": name,
        "image": image,
        "showing_order": showingOrder,
        "is_active": isActive,
    };
}

class Category {
    int? id;
    String? name;
    String? image;
    bool? isActive;
    int? showingOrder;
    String? slug;
    List<Product>? products;
    dynamic hexcode1;
    dynamic hexcode2;

    Category({
        this.id,
        this.name,
        this.image,
        this.isActive,
        this.showingOrder,
        this.slug,
        this.products,
        this.hexcode1,
        this.hexcode2,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        isActive: json["is_active"],
        showingOrder: json["showing_order"],
        slug: json["slug"],
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        hexcode1: json["hexcode_1"],
        hexcode2: json["hexcode_2"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "is_active": isActive,
        "showing_order": showingOrder,
        "slug": slug,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "hexcode_1": hexcode1,
        "hexcode_2": hexcode2,
    };
}

class Product {
    int? id;
    List<Variation>? variations;
    bool? inWishlist;
    int? avgRating;
    List<String>? images;
    bool? variationExists;
    int? salePrice;
    List<Addon>? addons;
    bool? available;
    String? availableFrom;
    String? availableTo;
    String? name;
    String? description;
    String? caption;
    String? featuredImage;
    int? mrp;
    int? stock;
    bool? isActive;
    String? discount;
    DateTime? createdDate;
    String? productType;
    dynamic showingOrder;
    String? variationName;
    int? category;
    int? taxRate;

    Product({
        this.id,
        this.variations,
        this.inWishlist,
        this.avgRating,
        this.images,
        this.variationExists,
        this.salePrice,
        this.addons,
        this.available,
        this.availableFrom,
        this.availableTo,
        this.name,
        this.description,
        this.caption,
        this.featuredImage,
        this.mrp,
        this.stock,
        this.isActive,
        this.discount,
        this.createdDate,
        this.productType,
        this.showingOrder,
        this.variationName,
        this.category,
        this.taxRate,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        variations: json["variations"] == null ? [] : List<Variation>.from(json["variations"]!.map((x) => Variation.fromJson(x))),
        inWishlist: json["in_wishlist"],
        avgRating: json["avg_rating"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        variationExists: json["variation_exists"],
        salePrice: json["sale_price"],
        addons: json["addons"] == null ? [] : List<Addon>.from(json["addons"]!.map((x) => Addon.fromJson(x))),
        available: json["available"],
        availableFrom: json["available_from"],
        availableTo: json["available_to"],
        name: json["name"],
        description: json["description"],
        caption: json["caption"],
        featuredImage: json["featured_image"],
        mrp: json["mrp"],
        stock: json["stock"],
        isActive: json["is_active"],
        discount: json["discount"],
        createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
        productType: json["product_type"],
        showingOrder: json["showing_order"],
        variationName: json["variation_name"],
        category: json["category"],
        taxRate: json["tax_rate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "variations": variations == null ? [] : List<dynamic>.from(variations!.map((x) => x.toJson())),
        "in_wishlist": inWishlist,
        "avg_rating": avgRating,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "variation_exists": variationExists,
        "sale_price": salePrice,
        "addons": addons == null ? [] : List<dynamic>.from(addons!.map((x) => x.toJson())),
        "available": available,
        "available_from": availableFrom,
        "available_to": availableTo,
        "name": name,
        "description": description,
        "caption": caption,
        "featured_image": featuredImage,
        "mrp": mrp,
        "stock": stock,
        "is_active": isActive,
        "discount": discount,
        "created_date": createdDate?.toIso8601String(),
        "product_type": productType,
        "showing_order": showingOrder,
        "variation_name": variationName,
        "category": category,
        "tax_rate": taxRate,
    };
}

class Addon {
    int? id;
    int? price;
    String? name;
    String? description;
    String? featuredImage;
    int? stock;
    bool? isActive;
    int? taxRate;

    Addon({
        this.id,
        this.price,
        this.name,
        this.description,
        this.featuredImage,
        this.stock,
        this.isActive,
        this.taxRate,
    });

    factory Addon.fromJson(Map<String, dynamic> json) => Addon(
        id: json["id"],
        price: json["price"],
        name: json["name"],
        description: json["description"],
        featuredImage: json["featured_image"],
        stock: json["stock"],
        isActive: json["is_active"],
        taxRate: json["tax_rate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "name": name,
        "description": description,
        "featured_image": featuredImage,
        "stock": stock,
        "is_active": isActive,
        "tax_rate": taxRate,
    };
}

class Variation {
    int? id;
    int? salePrice;
    String? variationName;
    String? featuredImage;
    int? stock;
    DateTime? created;
    bool? showStatus;
    int? showingOrder;
    int? product;

    Variation({
        this.id,
        this.salePrice,
        this.variationName,
        this.featuredImage,
        this.stock,
        this.created,
        this.showStatus,
        this.showingOrder,
        this.product,
    });

    factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        id: json["id"],
        salePrice: json["sale_price"],
        variationName: json["variation_name"],
        featuredImage: json["featured_image"],
        stock: json["stock"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        showStatus: json["show_status"],
        showingOrder: json["showing_order"],
        product: json["product"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sale_price": salePrice,
        "variation_name": variationName,
        "featured_image": featuredImage,
        "stock": stock,
        "created": created?.toIso8601String(),
        "show_status": showStatus,
        "showing_order": showingOrder,
        "product": product,
    };
}
