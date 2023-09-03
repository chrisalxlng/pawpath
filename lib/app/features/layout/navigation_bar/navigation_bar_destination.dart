import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pawpath/themes.dart';

class NavigationBarDestination extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback? callback;

  const NavigationBarDestination(
      {super.key,
      required this.label,
      required this.icon,
      this.isActive = false,
      this.callback});

  @override
  Widget build(BuildContext context) {
    const Color activeColor = AppColors.primary_100;
    final Color inactiveColor = AppColors.textSecondary(context);

    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.p0_5),
      child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
              onTap: () => callback?.call(),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon,
                      size: 24, color: isActive ? activeColor : inactiveColor),
                  const Gap(AppSpacing.p1),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: isActive ? activeColor : inactiveColor),
                  )
                ],
              ))),
    ));
  }
}
