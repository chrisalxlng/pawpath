import "package:flutter/widgets.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

String? validateRequired(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return S.of(context).validatorDogNameRequired;
  }
  return null;
}
