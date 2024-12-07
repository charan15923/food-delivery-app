// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../features/home/data/models/home_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataModel _$HomeDataModelFromJson(Map<String, dynamic> json) =>
    HomeDataModel(
      sliderItems: (json['sliderItems'] as List<dynamic>)
          .map((e) => DishModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      popularItems: (json['popularItems'] as List<dynamic>)
          .map((e) => DishModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataModelToJson(HomeDataModel instance) =>
    <String, dynamic>{
      'sliderItems': instance.sliderItems.map((e) => e.toJson()).toList(),
      'popularItems': instance.popularItems.map((e) => e.toJson()).toList(),
    };
