/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsJpgGen {
  const $AssetsJpgGen();

  /// File path: assets/jpg/back sky.jpg
  AssetGenImage get backSky => const AssetGenImage('assets/jpg/back sky.jpg');

  /// File path: assets/jpg/backgroudGame.jpg
  AssetGenImage get backgroudGame =>
      const AssetGenImage('assets/jpg/backgroudGame.jpg');

  /// File path: assets/jpg/background.jpg
  AssetGenImage get background =>
      const AssetGenImage('assets/jpg/background.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [backSky, backgroudGame, background];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/craft.png
  AssetGenImage get craft => const AssetGenImage('assets/png/craft.png');

  /// File path: assets/png/erth.png
  AssetGenImage get erth => const AssetGenImage('assets/png/erth.png');

  /// File path: assets/png/girl.png
  AssetGenImage get girl => const AssetGenImage('assets/png/girl.png');

  /// File path: assets/png/hatter.png
  AssetGenImage get hatter => const AssetGenImage('assets/png/hatter.png');

  /// File path: assets/png/iconUp.png
  AssetGenImage get iconUp => const AssetGenImage('assets/png/iconUp.png');

  /// File path: assets/png/shovel.png
  AssetGenImage get shovel => const AssetGenImage('assets/png/shovel.png');

  /// List of all assets
  List<AssetGenImage> get values => [craft, erth, girl, hatter, iconUp, shovel];
}

class $AssetsWebpGen {
  const $AssetsWebpGen();

  /// File path: assets/webp/man.webp
  AssetGenImage get man => const AssetGenImage('assets/webp/man.webp');

  /// File path: assets/webp/woman.webp
  AssetGenImage get woman => const AssetGenImage('assets/webp/woman.webp');

  /// List of all assets
  List<AssetGenImage> get values => [man, woman];
}

class Assets {
  Assets._();

  static const $AssetsJpgGen jpg = $AssetsJpgGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsWebpGen webp = $AssetsWebpGen();
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
    bool gaplessPlayback = false,
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
