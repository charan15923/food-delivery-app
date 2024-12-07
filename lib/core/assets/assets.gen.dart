/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Choclate-mousse.png
  AssetGenImage get choclateMousse =>
      const AssetGenImage('assets/images/Choclate-mousse.png');

  /// File path: assets/images/Dessert.png
  AssetGenImage get dessert => const AssetGenImage('assets/images/Dessert.png');

  /// File path: assets/images/Fruits-Plate.png
  AssetGenImage get fruitsPlate =>
      const AssetGenImage('assets/images/Fruits-Plate.png');

  /// File path: assets/images/Grilled-Chicken.png
  AssetGenImage get grilledChicken =>
      const AssetGenImage('assets/images/Grilled-Chicken.png');

  /// File path: assets/images/Pizza.png
  AssetGenImage get pizza => const AssetGenImage('assets/images/Pizza.png');

  /// File path: assets/images/Salad2.png
  AssetGenImage get salad2 => const AssetGenImage('assets/images/Salad2.png');

  /// File path: assets/images/Sweet-Bowl.png
  AssetGenImage get sweetBowl =>
      const AssetGenImage('assets/images/Sweet-Bowl.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        choclateMousse,
        dessert,
        fruitsPlate,
        grilledChicken,
        pizza,
        salad2,
        sweetBowl
      ];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/data.json
  String get data => 'assets/json/data.json';

  /// List of all assets
  List<String> get values => [data];
}

class AppAssets {
  AppAssets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
