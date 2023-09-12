import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.type.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_paged_layout/modal_sheet_paged_layout.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_paged_layout/modal_sheet_paged_layout.type.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.dart";

final _modalSheetPageControllerProvider =
    Provider<ModalSheetPageController>((_) => ModalSheetPageController());

class DogWalk extends ConsumerWidget {
  const DogWalk({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(_modalSheetPageControllerProvider);

    return ModalSheetPagedLayout(
      controller: controller,
      autoResetWhen: (currentPageIndex, pageCount) =>
          currentPageIndex == pageCount - 1,
      pages: [
        ModalSheetPage(
            appBar: const HeaderBar(
              title: "1",
            ),
            body: const Text("1"),
            action: ModalSheetAction(
                label: "1", onPressed: () => controller.nextPage())),
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
    );
  }
}
