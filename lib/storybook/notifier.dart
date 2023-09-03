import "package:flutter/material.dart";
import "package:pawpath/storybook/util.dart";

ValueNotifier<Brightness> brightnessNotifier =
    ValueNotifier<Brightness>(Brightness.light);

ValueNotifier<int> deviceIndexNotifier = ValueNotifier<int>(0);

ValueNotifier<int> localeIndexNotifier = ValueNotifier<int>(0);

ValueNotifier<StoryType> storyTypeNotifier =
    ValueNotifier<StoryType>(StoryType.ui);

changeBrightness() {
  brightnessNotifier.value = isLightTheme(brightnessNotifier.value)
      ? Brightness.dark
      : Brightness.light;
}

changeDevice() {
  deviceIndexNotifier.value++;
}

changeLocale() {
  localeIndexNotifier.value++;
}

changeStoryType(StoryType storyType) {
  Future.delayed(Duration.zero, () async {
    storyTypeNotifier.value = storyType;
  });
}

enum StoryType { ui, screen }
