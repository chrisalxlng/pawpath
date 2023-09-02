import 'package:flutter/material.dart';
import 'package:pawpath/storybook/wrapper.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

defaultUiBuilder(Widget child) => Container(
      color: Colors.white,
      child: child,
    );

screenStory(Widget widget) => Story(
      name: "Screens/${widget.toString()}",
      builder: (context) => widget,
      wrapperBuilder: (_, child) => screenWrapper(child),
    );

uiStory(Widget widget, [Widget Function(BuildContext context)? builder]) =>
    Story(
      name: "UI/${widget.toString()}",
      builder: (context) => builder != null
          ? defaultUiBuilder(builder(context))
          : defaultUiBuilder(widget),
      wrapperBuilder: (_, child) => uiWrapper(child),
    );
