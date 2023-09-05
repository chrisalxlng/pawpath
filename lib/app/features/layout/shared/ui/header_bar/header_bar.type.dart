import "package:flutter/material.dart";

class HeaderBarAction {
  final IconData iconData;
  final VoidCallback? onPressed;

  const HeaderBarAction({required this.iconData, this.onPressed});
}
