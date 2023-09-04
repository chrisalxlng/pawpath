import "dart:async";

import "package:flutter/material.dart";
import "package:pawpath/app/ui/touchable/touchable.dart";
import "package:pawpath/app/util.dart";

class Button extends StatefulWidget {
  final Widget Function(Color color) builder;
  final VoidCallback onPressed;
  final Color color;
  final double size;

  const Button({
    super.key,
    required this.builder,
    required this.onPressed,
    required this.color,
    this.size = 24,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late Color _color;

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Touchable(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => _onTapDown(),
        onTapUp: (_) => _onTapUp(),
        onTapCancel: () => _onTapCancel(),
        child: widget.builder(_color),
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
