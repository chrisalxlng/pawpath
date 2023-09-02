import 'package:flutter/material.dart';
import 'package:pawpath/storybook/wrapper.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

defaultUiBuilder(Widget child) => Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment(-0.2, -0.5),
          stops: [0.0, 0.5, 0.5, 1],
          colors: [
            Colors.orangeAccent,
            Colors.orangeAccent,
            Colors.black,
            Colors.black,
          ],
          tileMode: TileMode.repeated,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
            color: const Color.fromRGBO(73, 148, 236, 1), child: child),
      ),
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
