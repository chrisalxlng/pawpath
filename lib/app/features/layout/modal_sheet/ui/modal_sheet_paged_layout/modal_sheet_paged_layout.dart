import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_action_button/modal_sheet_action_button.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_base_layout/modal_sheet_base_layout.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_paged_layout/modal_sheet_paged_layout.type.dart";
import "package:pawpath/app/themes.dart";

const Duration _duration = Duration(milliseconds: 300);

final _modalSheetPageProvider =
    StateProvider.family<ModalSheetPage?, List<ModalSheetPage>>((ref, list) {
  final pageIndex = ref.watch(_pageIndexProvider);
  final nextPage = list[pageIndex];
  return list.isEmpty ? null : nextPage;
});

final _pageIndexProvider = StateProvider<int>((_) => 0);

class ModalSheetPagedLayout extends ConsumerStatefulWidget {
  final List<ModalSheetPage> pages;
  final ModalSheetPageController? controller;
  final bool Function(int currentPageIndex, int pageCount)? autoResetWhen;

  const ModalSheetPagedLayout(
      {super.key, this.pages = const [], this.controller, this.autoResetWhen});

  @override
  ConsumerState<ModalSheetPagedLayout> createState() =>
      _ModalSheetPagedLayoutState();
}

class _ModalSheetPagedLayoutState extends ConsumerState<ModalSheetPagedLayout> {
  late PageController pageController;
  late int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    ModalSheetPage? currentPage =
        ref.watch(_modalSheetPageProvider(widget.pages));
    currentPageIndex = ref.read(_pageIndexProvider);

    final appBar = currentPage?.appBar;
    final action = currentPage?.action;

    return ModalSheetBaseLayout(
        appBar: appBar,
        child: Column(
          children: [
            Expanded(
                child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: widget.pages
                  .map((page) => SingleChildScrollView(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.p4, vertical: AppSpacing.p8),
                        child: page.body,
                      )))
                  .toList(),
            )),
            if (action != null) ModalSheetActionButton(action: action),
          ],
        ));
  }

  @override
  void dispose() {
    final autoResetWhen = widget.autoResetWhen;
    final pageCount = widget.pages.length;
    if (autoResetWhen != null && autoResetWhen(currentPageIndex, pageCount)) {
      _invalidate();
    }
    super.dispose();
  }

  @override
  void initState() {
    final pageIndex = ref.read(_pageIndexProvider);
    pageController = PageController(initialPage: pageIndex);
    widget.controller?.reset = _reset;
    widget.controller?.nextPage = _nextPage;
    super.initState();
  }

  void _invalidate() {
    ref.invalidate(_pageIndexProvider);
  }

  void _nextPage() {
    ref.read(_pageIndexProvider.notifier).state++;
    pageController.nextPage(duration: _duration, curve: Curves.easeInOut);
  }

  void _reset() {
    _invalidate();
    final initialPage = pageController.initialPage.toDouble();
    pageController.jumpTo(initialPage);
  }
}
