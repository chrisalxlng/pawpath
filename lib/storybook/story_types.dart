import "package:flutter/material.dart";
import "package:pawpath/storybook/notifier.dart";
import "package:pawpath/storybook/wrapper.dart";
import "package:storybook_flutter/storybook_flutter.dart";

defaultUiBuilder(Widget child) => ValueListenableBuilder(
    valueListenable: uiBorderNotifier,
    builder: (_, borderActive, __) => borderActive
        ? Container(
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
          )
        : Padding(
            padding: const EdgeInsets.all(4),
            child: child,
          ));

featureStory(String feature, Widget widget) => Story(
      name: "Features/$feature/${widget.toString()}",
      builder: (context) => defaultUiBuilder(widget),
      wrapperBuilder: (_, child) => uiWrapper(child),
    );

featureStoryWithKnobs(String feature, String name,
        Widget Function(BuildContext context) builder) =>
    Story(
      name: "Features/$feature/$name",
      builder: (context) => defaultUiBuilder(builder(context)),
      wrapperBuilder: (_, child) => uiWrapper(child),
    );

modalSheetStory(Widget widget) => Story(
      name: "ModalSheets/${widget.toString()}",
      builder: (context) => widget,
      wrapperBuilder: (_, child) => modalSheetWrapper(child),
    );

screenStory(Widget widget) => Story(
      name: "Screens/${widget.toString()}",
      builder: (context) => widget,
      wrapperBuilder: (_, child) => screenWrapper(child),
    );

uiStory(Widget widget) => Story(
      name: "UI/${widget.toString()}",
      builder: (context) => defaultUiBuilder(widget),
      wrapperBuilder: (_, child) => uiWrapper(child),
    );

uiStoryWithKnobs(String name, Widget Function(BuildContext context) builder) =>
    Story(
      name: "UI/$name",
      builder: (context) => defaultUiBuilder(builder(context)),
      wrapperBuilder: (_, child) => uiWrapper(child),
    );
