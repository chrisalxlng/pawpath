import "package:freezed_annotation/freezed_annotation.dart";

part "dog.freezed.dart";

@freezed
class Dog with _$Dog {
  factory Dog(
      {required String name,
      @Default(false) bool isSelected,
      required String id}) = _Dog;
}
