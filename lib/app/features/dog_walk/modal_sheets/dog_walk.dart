import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:pawpath/app/features/dog_walk/pages/dog_selection.dart";
import "package:pawpath/app/features/dog_walk/state/dog_selection.state.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.type.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_paged_layout/modal_sheet_paged_layout.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_paged_layout/modal_sheet_paged_layout.type.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.dart";
import "package:pawpath/app/themes.dart";

final _modalSheetPageControllerProvider =
    Provider<ModalSheetPageController>((_) => ModalSheetPageController());

class DogWalk extends ConsumerWidget {
  const DogWalk({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(_modalSheetPageControllerProvider);
    final asyncDogList = ref.watch(dogSelectionListProvider);

    return asyncDogList.when(
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary_100),
      ),
      error: (error, stacktrace) {
        debugPrint(error.toString());
        debugPrint(stacktrace.toString());
        // TODO: Error handling
        return Text("Error: $error");
      },
      data: (dogs) => ModalSheetPagedLayout(
        controller: controller,
        autoResetWhen: (currentPageIndex, pageCount) =>
            currentPageIndex == pageCount - 1,
        pages: [
          ModalSheetPage(
              appBar: HeaderBar(
                title: S.of(context).dogSelectionTitle,
              ),
              body: DogSelection(dogs: dogs),
              action: ModalSheetAction(
                  label: S.of(context).startWalk,
                  onPressed: () {
                    controller.nextPage();
                    ref.read(dogSelectionListProvider.notifier).submit(dogs);
                  },
                  isDisabled: dogs.where((dog) => dog.isSelected).isEmpty)),
          ModalSheetPage(
              appBar: const HeaderBar(
                title: "2",
              ),
              body: const Text("2"),
              action: ModalSheetAction(
                  label: "2", onPressed: () => controller.nextPage())),
          ModalSheetPage(
              appBar: const HeaderBar(
                title: "3",
              ),
              body: const Text("3"),
              action: ModalSheetAction(
                label: "3",
                onPressed: () {
                  context.pop();
                },
              ))
        ],
      ),
    );
  }
}
