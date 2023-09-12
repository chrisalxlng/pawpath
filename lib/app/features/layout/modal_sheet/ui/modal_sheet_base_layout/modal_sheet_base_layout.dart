import "package:flutter/material.dart";
import "package:pawpath/app/themes.dart";

class ModalSheetBaseLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;

  const ModalSheetBaseLayout({super.key, this.appBar, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: appBar,
          backgroundColor: AppColors.backgroundPrimary(context),
          body: child),
    );
  }
}
