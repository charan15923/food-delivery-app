import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class UIDimensions {
  static final pixelRatio = ScreenUtil().pixelRatio; //Device pixel density

  static final screenWidth = ScreenUtil().screenWidth; //Device width

  static final screenHeight = ScreenUtil().screenHeight; //Device height

  static final bottomBarHeight = ScreenUtil()
      .bottomBarHeight; //Bottom safe zone distance, suitable for buttons with full screen

  static final statusBarHeight =
      ScreenUtil().statusBarHeight; //Status bar height , Notch will be higher

  static final textScaleFactor =
      ScreenUtil().textScaleFactor; //System font scaling factor

  static final scaleWidth =
      ScreenUtil().scaleWidth; //The ratio of actual width to UI design

  static final scaleHeight =
      ScreenUtil().scaleHeight; //The ratio of actual height to UI design
  static final orientation = ScreenUtil().orientation; //Screen orientation

  static double screenHeightPercentage(int percentage) =>
      (screenHeight / 100) * percentage;

  static double screenWidthPercentage(int percentage) =>
      (screenWidth / 100) * percentage;

  static double screenHeightWithSafeAreaPercentage(int percentage) =>
      ((screenHeight - ScreenUtil().bottomBarHeight) / 100) * percentage;

  static const Widget verticalSpaceSmall = RSizedBox(height: 8);
  static const Widget verticalSpaceMedium = RSizedBox(height: 16);
  static const Widget verticalSpaceLarge = RSizedBox(height: 32);

  static Widget verticalSpace(double height) => RSizedBox(height: height);
  static Widget sliverVerticalSpace(double height) =>
      SliverToBoxAdapter(child: RSizedBox(height: height));

  static const Widget horizontalSpaceSmall = RSizedBox(width: 8);
  static const Widget horizontalSpaceMedium = RSizedBox(width: 16);
  static const Widget horizontalSpaceLarge = RSizedBox(width: 32);

  static Widget horizontalSpace(double width) => RSizedBox(width: width);
  static Widget sliverHorizontalSpace(double width) =>
      SliverToBoxAdapter(child: RSizedBox(width: width));

  static Padding padding({
    required EdgeInsets padding,
    required Widget child,
  }) =>
      Padding(
        padding: REdgeInsets.fromLTRB(
          padding.left,
          padding.top,
          padding.right,
          padding.bottom,
        ),
        child: child,
      );

  static Padding horizontalPadding({
    required Widget child,
    EdgeInsets? padding,
  }) =>
      Padding(
        padding: padding != null
            ? REdgeInsets.fromLTRB(
                padding.left,
                padding.top,
                padding.right,
                padding.bottom,
              )
            : REdgeInsets.symmetric(horizontal: 16),
        child: child,
      );

  static Radius radiusCircular(
    double radius,
  ) =>
      Radius.circular(radius).w;

  static Radius radiusElliptical(
    double x,
    double y,
  ) =>
      Radius.elliptical(x, y).w;

  static SizedBox sizedBox({
    Widget? child,
    double? height,
    double? width,
  }) =>
      RSizedBox(
        height: height,
        width: width,
        child: child,
      );

  static EdgeInsets symmetricPaddingInsets({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) =>
      REdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      );

  static EdgeInsets onlyPaddingInsets({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      REdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      );

  static EdgeInsets lTRBPaddingInsets(
    double left,
    double top,
    double right,
    double bottom,
  ) =>
      REdgeInsets.fromLTRB(
        left,
        top,
        right,
        bottom,
      );

  static EdgeInsets allPaddingInsets(double val) => REdgeInsets.all(val);

  ///? Font Sizes
  /// You can use these directly if you need, but usually there should be a predefined style in TextStyles
  static double font32 = 32.sp;
  static double font28 = 28.sp;
  static double font24 = 24.sp;
  static double font20 = 20.sp;
  static double font18 = 18.sp;
  static double font16 = 16.sp;
  static double font14 = 14.sp;
  static double font12 = 12.sp;
  static double font10 = 10.sp;

  static double fontSize(double val) => val.sp;

  //? Icon Sizes
  static double icon24 = 24.sp;
  static double icon16 = 16.sp;
  static double icon8 = 8.sp;

  static double iconSize(double val) => val.sp;

  //? Radius
  static double imageR28 = 28.r;
  static double buttonR28 = 28.r;
  static double buttonR24 = 24.r;
  static double buttonR4 = 4.r;
  static double cardR24 = 24.r;
  static double cardR4 = 4.r;

  static double radius(double val) => val.r;

  //?Border Radius
  static BorderRadius borderRadius(BorderRadius radius) => BorderRadius.only(
        topLeft: radius.topLeft,
        topRight: radius.topRight,
        bottomLeft: radius.bottomLeft,
        bottomRight: radius.bottomRight,
      ).r;

  //?Width
  static double buttonW18 = 18.w;

  static double width(double val) => val.w;

  //?Height
  static double buttonH56 = 56.h;

  static double height(double val) => val.h;

  //?Input Decoration
  static OutlineInputBorder inputDecorationBorder({
    required Color borderColor,
    double borderWidth = 1.0,
    double borderRadius = 12,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)).r,
      borderSide: BorderSide(color: borderColor, width: borderWidth.w),
    );
  }

  static BorderRadius smoothBorderRadius({
    double cornerRadius = 12,
    double cornerSmoothing = 1.0,
  }) =>
      SmoothBorderRadius(
        cornerRadius: cornerRadius.r,
        cornerSmoothing: cornerSmoothing.w,
      );

  static OutlinedBorder smoothShapeBorder({
    required Color borderColor,
    double borderWidth = 1.0,
    double cornerRadius = 12,
    double cornerSmoothing = 1.0,
  }) {
    return SmoothRectangleBorder(
      side: BorderSide(
        width: borderWidth.w,
        color: borderColor,
      ),
      borderRadius: SmoothBorderRadius(
        cornerRadius: cornerRadius.r,
        cornerSmoothing: cornerSmoothing.w,
      ),
    );
  }

  static Decoration boxDecoration({
    BorderRadius? radius,
    Border? border,
    Color? boxColor,
    BoxShape boxShape = BoxShape.rectangle,
    Gradient? gradient,
    List<BoxShadow>? shadows,
    DecorationImage? image,
  }) {
    return BoxDecoration(
      border: border == null
          ? null
          : Border(
              left: border.left.copyWith(width: border.left.width.w),
              top: border.top.copyWith(width: border.top.width.w),
              right: border.right.copyWith(width: border.right.width.w),
              bottom: border.bottom.copyWith(width: border.bottom.width.w),
            ),
      color: boxColor,
      borderRadius: radius == null
          ? null
          : BorderRadius.only(
              topLeft: radius.topLeft,
              bottomLeft: radius.bottomLeft,
              topRight: radius.topRight,
              bottomRight: radius.bottomRight,
            ).r,
      shape: boxShape,
      gradient: gradient,
      boxShadow: shadows
          ?.map(
            (e) => BoxShadow(
              color: e.color,
              offset: e.offset,
              blurRadius: e.blurRadius.r,
              spreadRadius: e.spreadRadius.r,
              blurStyle: e.blurStyle,
            ),
          )
          .toList(),
      image: image,
    );
  }

  static SmoothRadius smoothRadius({
    double cornerRadius = 12,
    double cornerSmoothing = 1,
  }) =>
      SmoothRadius(
        cornerRadius: cornerRadius.r,
        cornerSmoothing: cornerSmoothing.w,
      );

  static Decoration shapeDecoration({
    Color? borderColor,
    double? cornerRadius,
    double? cornerSmoothing,
    double borderWidth = 1,
    Color? boxColor,
    BoxShape boxShape = BoxShape.rectangle,
    Gradient? gradient,
    List<BoxShadow>? shadows,
    DecorationImage? image,
  }) {
    return ShapeDecoration(
      color: boxColor,
      shape: SmoothRectangleBorder(
        side: BorderSide(
          width: borderWidth.w,
          color: borderColor ?? AppColors.transparent,
        ),
        borderRadius: SmoothBorderRadius(
          cornerRadius: (cornerRadius ?? 12).r,
          cornerSmoothing: (cornerSmoothing ?? 1).w,
        ),
      ),
      gradient: gradient,
      shadows: shadows
          ?.map(
            (e) => BoxShadow(
              color: e.color,
              offset: e.offset,
              blurRadius: e.blurRadius.r,
              spreadRadius: e.spreadRadius.r,
              blurStyle: e.blurStyle,
            ),
          )
          .toList(),
      image: image,
    );
  }

  static Divider divider({
    double? height,
    Color? color,
    double? indent,
    double? endIndent,
    double? thickness,
  }) =>
      Divider(
        height: height?.h,
        color: color,
        indent: indent?.w,
        endIndent: endIndent?.w,
        thickness: thickness?.h,
      );
}
