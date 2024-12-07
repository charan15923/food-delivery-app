import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/ui_dimensions.dart';

class BottomSheetService {
  static Future<T?> showBottomSheet<T>(
    BuildContext context,
    Widget sheet, {
    bool enableDrag = true,
    bool isDismissible = true,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.white,
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius.only(
          topLeft: UIDimensions.smoothRadius(cornerRadius: 16),
          topRight: UIDimensions.smoothRadius(cornerRadius: 16),
        ),
      ),
      builder: (context) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          sized: false,
          value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          child: FractionallySizedBox(
            heightFactor: 0.8,
            child: sheet,
          ),
        );
      },
    );
  }
}
