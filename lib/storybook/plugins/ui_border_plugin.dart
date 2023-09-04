import "package:flutter/material.dart";
import "package:pawpath/storybook/notifier.dart";
import "package:storybook_flutter/storybook_flutter.dart";

class UiBorderPlugin extends Plugin {
  UiBorderPlugin()
      : super(
            icon: (_) => ValueListenableBuilder(
                valueListenable: uiBorderNotifier,
                builder: (_, borderActive, __) => Icon(borderActive
                    ? Icons.border_outer_rounded
                    : Icons.border_clear_rounded)),
            onPressed: (_) => changeUiBorder());
}
