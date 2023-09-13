import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pawpath/app/domain/dog/dog_repository.dart";
import "package:pawpath/app/models/dog/dog.dart";
import "package:uuid/uuid.dart";

final mockDogRepository =
    Provider<MockDogRepository>((ref) => MockDogRepository());

class MockDogRepository extends DogRepository {
  @override
  Future<List<Dog>> addDog(Dog dog) {
    debugPrint("Added ${dog.name}");
    return getDogs();
  }

  @override
  Future<List<Dog>> getDogs() {
    return Future.delayed(
        const Duration(milliseconds: 200),
        () => [
              Dog(name: "Lulu", id: const Uuid().v1()),
              Dog(name: "Balu", id: const Uuid().v1())
            ]);
  }

  @override
  Future<List<Dog>> removeDog(String id) {
    debugPrint("Removed $id");
    return getDogs();
  }

  @override
  Future<List<Dog>> updateDog(Dog dog) {
    debugPrint("Updated ${dog.name}");
    return getDogs();
  }

  @override
  Future<List<Dog>> updateDogs(List<Dog> dogList) {
    debugPrint("Updated all dogs");
    return getDogs();
  }
}
