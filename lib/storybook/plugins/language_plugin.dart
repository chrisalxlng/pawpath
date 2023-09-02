import 'package:flutter/material.dart';
import 'package:pawpath/storybook/notifier.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class LanguagePlugin extends Plugin {
  LanguagePlugin()
      : super(
            icon: (_) => const Icon(Icons.language),
            onPressed: (_) => changeLocale());
}
