import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/select/select.dart";
import "package:pawpath/app/ui/select_group/select_group.type.dart";

class SelectGroup extends StatelessWidget {
  final List<SelectGroupOption> options;
  final List<ValueKey> selectedOptionKeys;
  final Function(List<ValueKey> selectedOptionKeys)? onChanged;

  const SelectGroup(
      {super.key,
      this.options = const [],
      this.selectedOptionKeys = const [],
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = options
        .expandIndexed((index, option) => [
              if (index != 0) const Gap(AppSpacing.p4),
              Select(
                key: option.key,
                label: option.label,
                color: AppColors.backgroundSecondary(context),
                isSelected: selectedOptionKeys.contains(option.key),
                onChanged: (isSelected) {
                  if (isSelected) {
                    onChanged?.call([...selectedOptionKeys, option.key]);
                  } else {
                    onChanged?.call(selectedOptionKeys
                        .where((selectedOptionKey) =>
                            option.key != selectedOptionKey)
                        .toList());
                  }
                },
              )
            ])
        .toList();

    return Column(children: items);
  }
}
