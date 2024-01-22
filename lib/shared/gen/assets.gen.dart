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

  /// File path: assets/images/app_icon.png
  AssetGenImage get appIcon =>
      const AssetGenImage('assets/images/app_icon.png');

  /// File path: assets/images/congratulations.png
  AssetGenImage get congratulations =>
      const AssetGenImage('assets/images/congratulations.png');

  /// File path: assets/images/default_profile_image.png
  AssetGenImage get defaultProfileImage =>
      const AssetGenImage('assets/images/default_profile_image.png');

  /// File path: assets/images/forget_password_1.png
  AssetGenImage get forgetPassword1 =>
      const AssetGenImage('assets/images/forget_password_1.png');

  /// File path: assets/images/forget_password_2.png
  AssetGenImage get forgetPassword2 =>
      const AssetGenImage('assets/images/forget_password_2.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_2.png
  AssetGenImage get logo2 => const AssetGenImage('assets/images/logo_2.png');

  /// File path: assets/images/slider_1.jpg
  AssetGenImage get slider1 =>
      const AssetGenImage('assets/images/slider_1.jpg');

  /// File path: assets/images/slider_2.png
  AssetGenImage get slider2 =>
      const AssetGenImage('assets/images/slider_2.png');

  /// File path: assets/images/slider_3.jpg
  AssetGenImage get slider3 =>
      const AssetGenImage('assets/images/slider_3.jpg');

  /// File path: assets/images/slider_4.jpg
  AssetGenImage get slider4 =>
      const AssetGenImage('assets/images/slider_4.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        appIcon,
        congratulations,
        defaultProfileImage,
        forgetPassword1,
        forgetPassword2,
        logo,
        logo2,
        slider1,
        slider2,
        slider3,
        slider4
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
