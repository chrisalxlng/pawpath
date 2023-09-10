import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:pawpath/app/features/dog_selection/state/dogs.state.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.type.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/group/group.dart";
import "package:pawpath/app/ui/select/select.dart";

class DogOverview extends ConsumerWidget {
  const DogOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget getLayout(Widget child) => ModalSheetLayout(
        appBar: HeaderBar(
            title: S.of(context).dogSelectionTitle,
            action: HeaderBarAction(
              iconData: CupertinoIcons.add_circled_solid,
              onPressed: () {
                final currentRouterPath = GoRouterState.of(context).fullPath;
                context.go("$currentRouterPath/add");
              },
            )),
        child: child);

    final asyncDogList = ref.watch(dogListProvider);
    return asyncDogList.when(
      loading: () => getLayout(const Center(
        child: CircularProgressIndicator(color: AppColors.primary_100),
      )),
      error: (error, stacktrace) {
        debugPrint(error.toString());
        debugPrint(stacktrace.toString());
        // TODO: Error handling
        return Text("Error: $error");
      },
      data: (dogs) => getLayout(Group(
        children: dogs
            .map((dog) => Select(
                label: dog.name,
                isSelected: dog.isSelected,
                color: AppColors.backgroundSecondary(context),
                onChanged: (isSelected) => ref
                    .read(dogListProvider.notifier)
                    .updateDog(dog.copyWith(isSelected: !dog.isSelected))))
            .toList(),
      )),
    );
  }
}
