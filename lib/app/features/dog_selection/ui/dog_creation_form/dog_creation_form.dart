import "package:flutter/material.dart" hide TextField, ElevatedButton;
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pawpath/app/features/dog_selection/ui/dog_creation_form/dog_creation_form_controller.dart";
import "package:pawpath/app/models/dog/dog.dart";
import "package:pawpath/app/ui/group/group.dart";
import "package:pawpath/app/ui/text_field/text_field.dart";
import "package:pawpath/app/ui/text_field/validators.dart";
import "package:uuid/uuid.dart";

final _dogNameProvider = StateProvider<String>((_) => "");

class DogCreationForm extends ConsumerStatefulWidget {
  final DogCreationFormController controller;
  final void Function(Dog dog)? onSubmitted;

  const DogCreationForm(
      {super.key, required this.controller, this.onSubmitted});

  @override
  ConsumerState<DogCreationForm> createState() => _DogCreationFormState();
}

class _DogCreationFormState extends ConsumerState<DogCreationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Group(
      children: [
        Form(
          key: _formKey,
          child: TextField(
            value: ref.read(_dogNameProvider),
            onSubmit: (value) =>
                ref.read(_dogNameProvider.notifier).state = value,
            label: S.of(context).dogNameLabel,
            placeholder: S.of(context).dogNamePlaceholder,
            validators: const [validateRequired],
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    widget.controller.submit = submit;
    super.initState();
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmitted
          ?.call(Dog(name: ref.read(_dogNameProvider), id: const Uuid().v1()));
      ref.invalidate(_dogNameProvider);
    }
  }
}
