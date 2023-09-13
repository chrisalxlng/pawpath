import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:pawpath/app/features/dog_management/state/dogs.state.dart";
import "package:pawpath/app/features/dog_management/ui/dog_form/dog_form.dart";
import "package:pawpath/app/features/dog_management/ui/dog_form/dog_form_controller.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.dart";
import "package:pawpath/app/features/layout/modal_sheet/ui/modal_sheet_layout/modal_sheet_layout.type.dart";
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.dart";
import "package:pawpath/app/ui/group/group.dart";

final _dogFormControllerProvider =
    Provider<DogFormController>((_) => DogFormController());

class AddDog extends ConsumerWidget {
  const AddDog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(_dogFormControllerProvider);

    return ModalSheetLayout(
        appBar: HeaderBar(title: S.of(context).dogCreationTitle),
        action: ModalSheetAction(
            label: S.of(context).add, onPressed: () => controller.submit()),
        child: Group(
          children: [
            Center(
              child: DogForm(
                  controller: controller,
                  onSubmitted: (dog) {
                    ref.read(dogListProvider.notifier).addDog(dog);
                    context.pop();
                  }),
            )
          ],
        ));
  }
}
