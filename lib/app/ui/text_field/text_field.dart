import "package:collection/collection.dart";
import "package:flutter/material.dart" hide TextField;
import "package:pawpath/app/themes.dart";
import "package:pawpath/app/ui/group/group.dart";

typedef Validator = String? Function(String? value, BuildContext context);

class TextField extends StatelessWidget {
  final String value;
  final void Function(String value)? onChanged;
  final List<Validator> validators;
  final String label;
  final String? placeholder;

  const TextField(
      {super.key,
      required this.value,
      required this.label,
      this.onChanged,
      this.validators = const [],
      this.placeholder});

  @override
  Widget build(BuildContext context) {
    InputDecoration getTextFieldDecoration(String? placeholder) =>
        InputDecoration(
          contentPadding: const EdgeInsets.all(AppSpacing.p5),
          filled: true,
          fillColor: AppColors.backgroundSecondary(context),
          hintText: placeholder,
          hintStyle: TextStyle(color: AppColors.textSecondary(context)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.md),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          errorStyle: const TextStyle(color: Colors.red),
        );

    return Group(
      spacing: AppSpacing.p2,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppSpacing.p3),
          child: Text(
            label,
            style: TextStyle(color: AppColors.textSecondary(context)),
          ),
        ),
        TextFormField(
          initialValue: value,
          onChanged: onChanged,
          validator: (value) {
            final Validator? validator =
                validators.firstWhereOrNull((v) => v(value, context) != null);
            return validator?.call(value, context);
          },
          cursorColor: AppColors.textPrimary(context),
          autofocus: true,
          keyboardAppearance: MediaQuery.of(context).platformBrightness,
          decoration: getTextFieldDecoration(placeholder),
        )
      ],
    );
  }
}
