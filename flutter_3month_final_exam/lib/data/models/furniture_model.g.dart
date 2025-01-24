// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'furniture_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FurnitureModel _$FurnitureModelFromJson(Map<String, dynamic> json) =>
    FurnitureModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => Furniture.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FurnitureModelToJson(FurnitureModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };

Furniture _$FurnitureFromJson(Map<String, dynamic> json) => Furniture(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      shortDescription: json['short_description'] as String,
      icon: json['icon'] as String,
      image: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      ratingCount: (json['rating_count'] as num).toInt(),
      colors: Colors.fromJson(json['colors'] as Map<String, dynamic>),
      size: Size.fromJson(json['size'] as Map<String, dynamic>),
      category: json['category'] as String,
    );

Map<String, dynamic> _$FurnitureToJson(Furniture instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'short_description': instance.shortDescription,
      'icon': instance.icon,
      'image': instance.image,
      'quantity': instance.quantity,
      'price': instance.price,
      'discount': instance.discount,
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
      'colors': instance.colors,
      'size': instance.size,
      'category': instance.category,
    };

Colors _$ColorsFromJson(Map<String, dynamic> json) => Colors(
      name: json['name'] as String,
      colorHexFlutter: json['color_hex_flutter'] as String,
    );

Map<String, dynamic> _$ColorsToJson(Colors instance) => <String, dynamic>{
      'name': instance.name,
      'color_hex_flutter': instance.colorHexFlutter,
    };

Size _$SizeFromJson(Map<String, dynamic> json) => Size(
      width: (json['width'] as num).toInt(),
      depth: (json['depth'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      seatWidth: (json['seat_width'] as num).toInt(),
      seatDepth: (json['seat_depth'] as num).toInt(),
      seatHeight: (json['seat_height'] as num).toInt(),
    );

Map<String, dynamic> _$SizeToJson(Size instance) => <String, dynamic>{
      'width': instance.width,
      'depth': instance.depth,
      'height': instance.height,
      'seat_width': instance.seatWidth,
      'seat_depth': instance.seatDepth,
      'seat_height': instance.seatHeight,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      totalRecords: (json['total_records'] as num).toInt(),
      currentPage: (json['current_page'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
      nextPage: json['next_page'],
      prevPage: json['prev_page'],
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'total_records': instance.totalRecords,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
      'next_page': instance.nextPage,
      'prev_page': instance.prevPage,
    };
