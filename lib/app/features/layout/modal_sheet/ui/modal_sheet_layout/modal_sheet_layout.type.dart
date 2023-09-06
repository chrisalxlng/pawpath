import "package:flutter/material.dart";

class ModalSheetAction {
  final String label;
  final VoidCallback? onPressed;
  final bool isDisabled;

  const ModalSheetAction(
      {required this.label, this.onPressed, this.isDisabled = false});
}
