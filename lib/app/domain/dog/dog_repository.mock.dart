import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pawpath/app/domain/dog/dog_repository.dart";
import "package:pawpath/app/models/dog/dog.dart";
import "package:uuid/uuid.dart";

final mockDogRepository =
    Provider<MockDogRepository>((ref) => MockDogRepository());

class MockDogRepository extends DogRepository {
  @override
  Dog addDog(Dog dog) {
    debugPrint("Added ${dog.name}");
    return dog;
  }

  @override
  List<Dog> getDogs() {
    return [
      Dog(name: "Lulu", id: const Uuid().v1()),
      Dog(name: "Balu", id: const Uuid().v1())
    ];
  }

  @override
  void removeDog(String id) {
    debugPrint("Removed $id");
  }

  @override
  Dog updateDog(Dog dog) {
    debugPrint("Updated ${dog.name}");
    return dog;
  }
}
