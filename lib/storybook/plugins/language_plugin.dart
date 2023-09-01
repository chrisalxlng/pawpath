import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class LanguagePlugin extends Plugin {
  final VoidCallback onLanguageChange;

  LanguagePlugin(this.onLanguageChange)
      : super(
            icon: (context) => const Icon(Icons.language),
            onPressed: (context) => onLanguageChange());
}
