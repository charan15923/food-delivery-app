import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';

class AddInPokeListTile extends StatelessWidget {
  const AddInPokeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Text(
        'Add in poke',
        style: context.textTheme.bodyLarge?.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontSize: UIDimensions.font16,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.black,
        size: UIDimensions.iconSize(10),
      ),
    );
  }
}
