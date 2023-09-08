import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:pawpath/app/features/dog_selection/state/dogs.state.dart";
import "package:pawpath/app/features/dog_selection/ui/dog_creation_form/dog_creation_form.dart";
import "package:pawpath/app/features/dog_selection/ui/dog_creation_form/dog_creation_form_controller.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.type.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.dart";
import "package:pawpath/app/ui/group/group.dart";

final _dogCreationFormControllerProvider =
    Provider<DogCreationFormController>((_) => DogCreationFormController());

class DogCreation extends ConsumerWidget {
  const DogCreation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ModalSheetLayout(
        appBar: HeaderBar(title: S.of(context).dogCreationTitle),
        action: ModalSheetAction(
            label: S.of(context).add,
            onPressed: () =>
                ref.read(_dogCreationFormControllerProvider).submit()),
        child: Group(
          children: [
            Center(
              child: DogCreationForm(
                  controller: ref.read(_dogCreationFormControllerProvider),
                  onSubmitted: (dog) {
                    ref.read(dogListProvider.notifier).add(dog);
                    context.pop();
                  }),
            )
          ],
        ));
  }
}
