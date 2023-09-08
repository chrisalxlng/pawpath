import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:pawpath/app/themes.dart";

class Group extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment alignment;
  final double spacing;

  const Group(
      {super.key,
      this.children = const [],
      this.spacing = AppSpacing.p4,
      this.alignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = this
        .children
        .expandIndexed(
            (index, option) => [if (index != 0) Gap(spacing), option])
        .toList();

    return Wrap(
      children: [Column(crossAxisAlignment: alignment, children: children)],
    );
  }
}
