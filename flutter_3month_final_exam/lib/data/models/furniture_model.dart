import 'package:json_annotation/json_annotation.dart';

part 'furniture_model.g.dart';

@JsonSerializable()
class FurnitureModel {
  @JsonKey(name: "data")
  final List<Furniture> data;

  @JsonKey(name: "pagination")
  final Pagination? pagination; // Nullable to handle null values

  FurnitureModel({
    required this.data,
    this.pagination, // No "required" keyword
  });

  factory FurnitureModel.fromJson(Map<String, dynamic> json) =>
      _$FurnitureModelFromJson(json);

  Map<String, dynamic> toJson() => _$FurnitureModelToJson(this);
}

@JsonSerializable()
class Furniture {
  @JsonKey(name: "_id")
  final String id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "description")
  final String description;

  @JsonKey(name: "short_description")
  final String shortDescription;

  @JsonKey(name: "icon")
  final String icon;

  @JsonKey(name: "image")
  final List<String> image;

  @JsonKey(name: "quantity") // Fixed typo from 'quintity'
  final int quantity;

  @JsonKey(name: "price")
  final double price;

  @JsonKey(name: "discount")
  final int discount;

  @JsonKey(name: "rating")
  final double rating;

  @JsonKey(name: "rating_count")
  final int ratingCount;

  @JsonKey(name: "colors")
  final Colors colors;

  @JsonKey(name: "size")
  final Size size;

  @JsonKey(name: "category")
  final String category;

  Furniture({
    required this.id,
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.icon,
    required this.image,
    required this.quantity,
    required this.price,
    required this.discount,
    required this.rating,
    required this.ratingCount,
    required this.colors,
    required this.size,
    required this.category,
  });

  factory Furniture.fromJson(Map<String, dynamic> json) =>
      _$FurnitureFromJson(json);

  Map<String, dynamic> toJson() => _$FurnitureToJson(this);
}

@JsonSerializable()
class Colors {
  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "color_hex_flutter")
  final String colorHexFlutter;

  Colors({
    required this.name,
    required this.colorHexFlutter,
  });

  factory Colors.fromJson(Map<String, dynamic> json) => _$ColorsFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsToJson(this);
}

@JsonSerializable()
class Size {
  @JsonKey(name: "width")
  final int width;

  @JsonKey(name: "depth")
  final int depth;

  @JsonKey(name: "height") // Fixed typo from 'heigth'
  final int height;

  @JsonKey(name: "seat_width")
  final int seatWidth;

  @JsonKey(name: "seat_depth")
  final int seatDepth;

  @JsonKey(name: "seat_height") // Fixed typo from 'seat_heigth'
  final int seatHeight;

  Size({
    required this.width,
    required this.depth,
    required this.height,
    required this.seatWidth,
    required this.seatDepth,
    required this.seatHeight,
  });

  factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);

  Map<String, dynamic> toJson() => _$SizeToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: "total_records")
  final int totalRecords;

  @JsonKey(name: "current_page")
  final int currentPage;

  @JsonKey(name: "total_pages")
  final int totalPages;

  @JsonKey(name: "next_page")
  final dynamic nextPage;

  @JsonKey(name: "prev_page")
  final dynamic prevPage;

  Pagination({
    required this.totalRecords,
    required this.currentPage,
    required this.totalPages,
    required this.nextPage,
    required this.prevPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
