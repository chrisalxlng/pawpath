import "dart:convert";

import "package:flutter/material.dart";

Color darkenColor(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Exception getException(String origin, [String? hint]) =>
    Exception("Exception in $origin: ${hint ?? "No hint"}");

bool isLightTheme(BuildContext context) =>
    Theme.of(context).brightness == Brightness.light;

List jsonDecodeList(List<String> list) =>
    list.map((e) => jsonDecode(e)).toList();

List<String> jsonEncodeList(List list) =>
    list.map<String>((e) => jsonEncode(e)).toList();

List<T> replaceListElementByCondition<T>(
    List<T> list, T element, bool Function(T) condition) {
  final updatedElementIndex = list.indexWhere(condition);
  final newList = [...list];
  newList.replaceRange(updatedElementIndex, updatedElementIndex + 1, [element]);
  return newList;
}
