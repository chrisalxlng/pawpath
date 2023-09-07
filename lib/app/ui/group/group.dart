import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:pawpath/app/themes.dart";

class Group extends StatelessWidget {
  final List<Widget> options;
  final double spacing;

  const Group(
      {super.key, this.options = const [], this.spacing = AppSpacing.p4});

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = options
        .expandIndexed(
            (index, option) => [if (index != 0) Gap(spacing), option])
        .toList();

    return Column(children: items);
  }
}
