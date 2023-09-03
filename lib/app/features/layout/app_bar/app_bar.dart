import 'package:flutter/material.dart' hide IconButton;
import 'package:pawpath/app/themes.dart';
import 'package:pawpath/app/ui/buttons/icon_button/icon_button.dart';

const double appBarHeight = 60;

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.backgroundSecondary(context),
          boxShadow: const [
            AppShadows.bottom,
          ]),
      padding: const EdgeInsets.all(AppSpacing.p4),
      height: appBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                height: 1,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.textPrimary(context)),
          ),
          IconButton(
            onPressed: () => debugPrint("TODO: Open bottom sheet"),
            iconData: Icons.swap_horizontal_circle,
            color: AppColors.primary_100,
            size: 30,
          ),
        ],
      ),
    );
  }
}
