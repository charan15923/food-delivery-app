import 'package:json_annotation/json_annotation.dart';
import '../../../../core/assets/assets.gen.dart';
import '../../../../core/utils/asset_gen_image_converter.dart';
import '../../domain/entities/dish_entity.dart';

part '../../../../gen/home/models/dish_model.g.dart';

@JsonSerializable()
class DishModel extends DishEntity {
  const DishModel({
    required super.id,
    required super.name,
    required this.image,
    required super.price,
    required super.description,
    required super.calories,
    required super.grams,
    required super.proteins,
    required super.fats,
    required super.carbs,
    required super.gradientIndex,
  }) : super(
          image: image,
        );

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);
  @override
  @AssetGenImageConverter()
  final AssetGenImage image;

  Map<String, dynamic> toJson() => _$DishModelToJson(this);
}
