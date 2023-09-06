import "package:flutter/cupertino.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:go_router/go_router.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.type.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.type.dart";
import "package:pawpath/app/ui/select_group/select_group.dart";
import "package:pawpath/app/ui/select_group/select_group.type.dart";

class DogOverview extends StatelessWidget {
  const DogOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalSheetLayout(
        appBar: HeaderBar(
            title: S.of(context).dogSelectionTitle,
            action: HeaderBarAction(
              iconData: CupertinoIcons.add_circled_solid,
              onPressed: () {
                final currentRouterPath = GoRouterState.of(context).fullPath;
                context.go("$currentRouterPath/add");
              },
            )),
        action: ModalSheetAction(label: S.of(context).selectDog(1)),
        child: const SelectGroup(
          options: [
            SelectGroupOption(key: ValueKey("Lulu"), label: "Lulu"),
            SelectGroupOption(key: ValueKey("Balu"), label: "Balu"),
            SelectGroupOption(key: ValueKey("Felix"), label: "Felix"),
            SelectGroupOption(key: ValueKey("Tom"), label: "Tom"),
          ],
          selectedOptionKeys: [ValueKey("Lulu")],
        ));
  }
}
