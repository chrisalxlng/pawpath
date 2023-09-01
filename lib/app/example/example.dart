import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).helloWorld,
      style: TextStyle(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.red
              : Colors.blue),
    );
  }
}
