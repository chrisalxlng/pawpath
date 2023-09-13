import "package:flutter/cupertino.dart";
import "package:flutter/material.dart" hide Card;
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:pawpath/app/features/dog_management/state/dogs.state.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.type.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/card/card.dart";
import "package:pawpath/app/ui/group/group.dart";

class DogOverview extends ConsumerWidget {
  const DogOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget getLayout(Widget child) => ModalSheetLayout(
        appBar: HeaderBar(
            title: S.of(context).dogOverviewTitle,
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
            .map((dog) => Card(
                  color: AppColors.backgroundSecondary(context),
                  onPressed: () {
                    final currentRouterPath =
                        GoRouterState.of(context).fullPath;
                    context.go("$currentRouterPath/edit/${dog.id}");
                  },
                  child: Row(
                    children: [
                      Text(
                        dog.name,
                        style: TextStyle(
                            color: AppColors.textPrimary(context),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ))
            .toList(),
      )),
    );
  }
}

// ref
//                     .read(dogListProvider.notifier)
//                     .updateDog(dog.copyWith(isSelected: !dog.isSelected))