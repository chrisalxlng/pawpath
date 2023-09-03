import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pawpath/app/util.dart';
import 'package:pawpath/themes.dart';

class IconButton extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final Color color;
  final double size;

  const IconButton({
    super.key,
    required this.iconData,
    required this.onPressed,
    required this.color,
    this.size = 24,
  });

  @override
  State<IconButton> createState() => _IconButtonState();
}

class _IconButtonState extends State<IconButton> {
  late Color _color;

  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => _onTapDown(),
        onTapUp: (_) => _onTapUp(),
        onTapCancel: () => _onTapCancel(),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.p1),
          child: SizedBox.square(
            dimension: widget.size,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Icon(
                widget.iconData,
                color: _color,
              ),
            ),
          ),
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
