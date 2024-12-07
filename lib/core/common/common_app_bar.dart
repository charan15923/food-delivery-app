import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../utils/context_extension.dart';
import '../utils/ui_dimensions.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.title,
    this.actions,
    this.onBackPressed,
    this.elevation = 0.0,
    this.hideLeading = false,
    this.titleSpacing = 16,
  });

  final String? title;
  final List<Widget>? actions;
  final double elevation;
  final VoidCallback? onBackPressed;
  final bool hideLeading;
  final int titleSpacing;

  @override
  Size get preferredSize => Size.fromHeight(UIDimensions.height(72));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: elevation,
      leading: hideLeading
          ? const SizedBox()
          : GestureDetector(
              onTap: onBackPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
              child: UIDimensions.padding(
                padding: const EdgeInsets.only(left: 15),
                child: PhosphorIcon(
                  PhosphorIconsRegular.arrowLeft,
                  size: UIDimensions.font32,
                  // color: context.iconThemeExtension.primary,
                ),
              ),
            ),
      titleSpacing: UIDimensions.width(titleSpacing.toDouble()),
      centerTitle: false,
      title: title != null && title!.isNotEmpty
          ? Text(
              title!,
            )
          : null,
      titleTextStyle: context.headlineMedium.copyWith(),
      actions: actions,
    );
  }
}
