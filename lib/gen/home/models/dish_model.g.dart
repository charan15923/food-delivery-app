// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../features/home/data/models/dish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishModel _$DishModelFromJson(Map<String, dynamic> json) => DishModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: const AssetGenImageConverter().fromJson(json['image'] as String),
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      calories: json['calories'] as String,
      grams: json['grams'] as String,
      proteins: json['proteins'] as String,
      fats: json['fats'] as String,
      carbs: json['carbs'] as String,
      gradientIndex: (json['gradientIndex'] as num).toInt(),
    );

Map<String, dynamic> _$DishModelToJson(DishModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'calories': instance.calories,
      'grams': instance.grams,
      'proteins': instance.proteins,
      'fats': instance.fats,
      'carbs': instance.carbs,
      'gradientIndex': instance.gradientIndex,
      'image': const AssetGenImageConverter().toJson(instance.image),
    };
