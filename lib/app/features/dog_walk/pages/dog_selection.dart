import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pawpath/app/features/dog_walk/state/dog_selection.state.dart";
import "package:pawpath/app/models/dog/dog.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/group/group.dart";
import "package:pawpath/app/ui/select/select.dart";

class DogSelection extends ConsumerWidget {
  final List<Dog> dogs;

  const DogSelection({super.key, this.dogs = const []});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Group(
      children: dogs
          .map((dog) => Select(
              label: dog.name,
              isSelected: dog.isSelected,
              color: AppColors.backgroundSecondary(context),
              onChanged: (_) => ref
                  .read(dogSelectionListProvider.notifier)
                  .toggleSelection(dogs, dog)))
          .toList(),
    );
  }
}
