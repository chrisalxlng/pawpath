import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() {
  runApp(const StorybookApp());
}

class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) => Storybook(
        stories: [
          Story(
            name: 'Widgets/Text',
            description: 'Simple text widget.',
            builder: (context) => Center(
                child: Text(
              'Simple text',
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.red
                      : Colors.blue),
            )),
          ),
        ],
      );
}
