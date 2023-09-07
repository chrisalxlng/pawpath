import "dart:async";

import "package:flutter/material.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/touchable/touchable.dart";
import "package:pawpath/app/util.dart";

class Button extends StatefulWidget {
  final Widget Function(Color color, Color textColor) builder;
  final VoidCallback onPressed;
  final bool isDisabled;
  final Color color;
  final double size;

  const Button({
    super.key,
    required this.builder,
    required this.onPressed,
    this.isDisabled = false,
    required this.color,
    this.size = 24,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late Color _color;
  late Color _textColor;

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Touchable(
      isDisabled: widget.isDisabled,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => widget.isDisabled ? null : _onTapDown(),
        onTapUp: (_) => widget.isDisabled ? null : _onTapUp(),
        onTapCancel: () => widget.isDisabled ? null : _onTapCancel(),
        child: widget.builder(
          widget.isDisabled ? Colors.grey : _color,
          widget.isDisabled ? Colors.blueGrey : _textColor,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    setState(() {
      _color = widget.color;
      _textColor = AppColors.light_100;
    });
    super.initState();
  }

  _darkenColor() {
    _timer = Timer(const Duration(milliseconds: 100), () {});
    setState(() {
      _color = darkenColor(widget.color);
    });
  }

  _onTapCancel() async {
    _resetColor();
  }

  _onTapDown() {
    _darkenColor();
  }

  _onTapUp() async {
    widget.onPressed();
    _resetColor();
  }

  _resetColor() async {
    while (_timer?.isActive ?? false) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    setState(() {
      _color = widget.color;
    });
  }
}
