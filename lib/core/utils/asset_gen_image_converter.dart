import 'package:json_annotation/json_annotation.dart';
import '../../../../core/assets/assets.gen.dart';

class AssetGenImageConverter implements JsonConverter<AssetGenImage, String> {
  const AssetGenImageConverter();

  @override
  AssetGenImage fromJson(String json) => AssetGenImage(json);

  @override
  String toJson(AssetGenImage image) => image.keyName;
}
