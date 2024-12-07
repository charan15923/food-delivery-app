import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/home_data_entity.dart';
import 'dish_model.dart';

part '../../../../gen/home/models/home_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeDataModel extends HomeDataEntity {
  const HomeDataModel({
    required this.sliderItems,
    required this.popularItems,
  }) : super(
          sliderItems: sliderItems,
          popularItems: popularItems,
        );

  factory HomeDataModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDataModelFromJson(json);

  @override
  final List<DishModel> sliderItems;
  @override
  final List<DishModel> popularItems;

  Map<String, dynamic> toJson() => _$HomeDataModelToJson(this);
}
