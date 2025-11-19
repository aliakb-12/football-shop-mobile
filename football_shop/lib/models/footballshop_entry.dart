import 'dart:convert';

List<FootballShopEntry> footballShopEntryFromJson(String str) =>
    List<FootballShopEntry>.from(
        json.decode(str).map((x) => FootballShopEntry.fromJson(x)));

String footballShopEntryToJson(List<FootballShopEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FootballShopEntry {
  Model model;
  String pk;
  Fields fields;

  FootballShopEntry({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory FootballShopEntry.fromJson(Map<String, dynamic> json) =>
      FootballShopEntry(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int? user;
  String name;
  int price;
  String description;
  String thumbnail;
  Category category;
  bool isFeatured;
  int productSold;
  DateTime createdAt;

  Fields({
    required this.user,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
    required this.productSold,
    required this.createdAt,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        category: categoryValues.map[json["category"]] ?? Category.JERSEY,
        isFeatured: json["is_featured"],
        productSold: json["product_sold"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": categoryValues.reverse[category],
        "is_featured": isFeatured,
        "product_sold": productSold,
        "created_at": createdAt.toIso8601String(),
      };
}

/// FIX: now supports 3 categories (jersey, full jersey, pants)
enum Category {
  FULL_JERSEY,
  JERSEY,
  PANTS,
}

final categoryValues = EnumValues({
  "full jersey": Category.FULL_JERSEY,
  "jersey": Category.JERSEY,
  "pants": Category.PANTS,
});

enum Model { MAIN_PRODUCT }

final modelValues = EnumValues({
  "main.product": Model.MAIN_PRODUCT,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
