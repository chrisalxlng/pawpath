import "package:flutter/material.dart" hide TextField, ElevatedButton;
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pawpath/app/features/dog_management/ui/dog_form/dog_form_controller.dart";
import "package:pawpath/app/models/dog/dog.dart";
import "package:pawpath/app/ui/group/group.dart";
import "package:pawpath/app/ui/text_field/text_field.dart";
import "package:pawpath/app/ui/text_field/validators.dart";
import "package:uuid/uuid.dart";

class DogForm extends ConsumerStatefulWidget {
  final Dog? dog;
  final DogFormController controller;
  final void Function(Dog dog)? onSubmitted;

  const DogForm(
      {super.key, this.dog, required this.controller, this.onSubmitted});

  @override
  ConsumerState<DogForm> createState() => _DogFormState();
}

class _DogFormState extends ConsumerState<DogForm> {
  final _formKey = GlobalKey<FormState>();

  String _dogName = "";

  @override
  Widget build(BuildContext context) {
    return Group(
      children: [
        Form(
          key: _formKey,
          child: TextField(
            value: _dogName,
            onChanged: (value) => setState(() => _dogName = value),
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
    _dogName = widget.dog?.name ?? "";
    super.initState();
  }

  void submit() {
    if (!_formKey.currentState!.validate()) return;
    final dog = widget.dog;
    if (dog == null) {
      widget.onSubmitted?.call(Dog(name: _dogName, id: const Uuid().v1()));
    } else {
      widget.onSubmitted?.call(dog.copyWith(name: _dogName));
    }
  }
}
