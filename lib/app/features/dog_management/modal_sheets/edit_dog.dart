import "package:flutter/cupertino.dart";
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
import "package:pawpath/app/features/layout/shared/ui/header_bar/header_bar.type.dart";
import "package:pawpath/app/models/dog/dog.dart";
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/group/group.dart";

final _dogCreationFormControllerProvider =
    Provider<DogFormController>((_) => DogFormController());

class EditDog extends ConsumerWidget {
  final String id;

  const EditDog({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(_dogCreationFormControllerProvider);
    final dog = ref.read(dogListProvider.notifier).getDog(id);

    getLayout(Widget child) => ModalSheetLayout(
        appBar: HeaderBar(
            title: S.of(context).editDogTitle,
            action: HeaderBarAction(
                iconData: CupertinoIcons.trash_circle_fill,
                onPressed: () =>
                    ref.read(dogListProvider.notifier).removeDog(id))),
        action: ModalSheetAction(
            label: S.of(context).update, onPressed: () => controller.submit()),
        child: Group(
          children: [
            Center(
              child: child,
            )
          ],
        ));

    return FutureBuilder(
      future: dog,
      builder: (BuildContext context, AsyncSnapshot<Dog> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return getLayout(
                const CircularProgressIndicator(color: AppColors.primary_100));
          default:
            if (snapshot.hasError) {
              return getLayout(Text("Error: ${snapshot.error}"));
            } else {
              return getLayout(DogForm(
                  dog: snapshot.data,
                  controller: controller,
                  onSubmitted: (dog) {
                    ref.read(dogListProvider.notifier).updateDog(dog);
                    context.pop();
                  }));
            }
        }
      },
    );
  }
}
