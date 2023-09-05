import "package:flutter/material.dart" hide IconButton;
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.type.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/buttons/icon_button/icon_button.dart";

const double headerBarHeight = 60;

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final HeaderBarAction? action;

  const HeaderBar({super.key, required this.title, this.action});

  @override
  Size get preferredSize => const Size.fromHeight(headerBarHeight);

  @override
  Widget build(BuildContext context) {
    final action = this.action;

    return Container(
      decoration: BoxDecoration(
          color: AppColors.backgroundSecondary(context),
          boxShadow: const [
            AppShadows.bottom,
          ]),
      padding: const EdgeInsets.all(AppSpacing.p4),
      height: headerBarHeight,
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
          if (action != null)
            IconButton(
              onPressed: () => action.onPressed?.call(),
              iconData: action.iconData,
              color: AppColors.primary_100,
              size: 30,
            ),
        ],
      ),
    );
  }
}
