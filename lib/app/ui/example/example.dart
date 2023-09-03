import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pawpath/storybook/util.dart';
import 'package:pawpath/themes.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).helloWorld,
      style: TextStyle(
          color: isLightTheme(Theme.of(context).brightness)
              ? AppColors.dark_100
              : AppColors.light_100),
    );
  }
}
