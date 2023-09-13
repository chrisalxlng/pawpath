import "package:collection/collection.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pawpath/app/data/local_storage/local_storage_api.dart";
import "package:pawpath/app/data/local_storage/local_storage_keys.dart";
import "package:pawpath/app/domain/dog/dog_repository.dart";
import "package:pawpath/app/models/dog/dog.dart";
import "package:pawpath/app/util.dart";

final localDogRepository =
    Provider<LocalDogRepository>((ref) => LocalDogRepository(ref));

class LocalDogRepository extends DogRepository {
  final ProviderRef<LocalDogRepository> ref;

  LocalDogRepository(this.ref);

  @override
  Future<List<Dog>> addDog(Dog dog) async {
    final localStorage = ref.read(localStorageProvider);
    final currentEntry = await getDogs();
    final newEntry = [...currentEntry, dog];
    final serializedNewEntry = jsonEncodeList(newEntry);
    final isSuccess =
        await localStorage.storeList(LocalStorageKey.dogs, serializedNewEntry);
    if (isSuccess) return getDogs();
    throw getException("$LocalDogRepository", "addDog");
  }

  @override
  Future<Dog> getDog(String id) async {
    final currentEntry = await getDogs();
    final dog = currentEntry.firstWhereOrNull((element) => element.id == id);
    if (dog != null) return dog;
    throw getException("$LocalDogRepository", "getDog");
  }

  @override
  Future<List<Dog>> getDogs() async {
    final localStorage = ref.read(localStorageProvider);
    try {
      final serializedEntry = localStorage.getList(LocalStorageKey.dogs);
      if (serializedEntry == null) {
        throw getException("$LocalDogRepository", "getDogs");
      }
      final deserializedEntry = jsonDecodeList(serializedEntry);
      final dogList =
          deserializedEntry.map((entry) => Dog.fromJson(entry)).toList();
      return dogList;
    } catch (error) {
      debugPrint(error.toString());
      return [];
    }
  }

  @override
  Future<List<Dog>> removeDog(String id) async {
    final localStorage = ref.read(localStorageProvider);
    final currentEntry = await getDogs();
    final newEntry = currentEntry.where((element) => element.id != id).toList();
    final serializedNewEntry = jsonEncodeList(newEntry);
    final isSuccess =
        await localStorage.storeList(LocalStorageKey.dogs, serializedNewEntry);
    if (isSuccess) return getDogs();
    throw getException("$LocalDogRepository", "removeDog");
  }

  @override
  Future<List<Dog>> removeDogs() async {
    final localStorage = ref.read(localStorageProvider);
    final isSuccess = await localStorage.removeItem(LocalStorageKey.dogs);
    if (isSuccess) return getDogs();
    throw getException("$LocalDogRepository", "removeDogs");
  }

  @override
  Future<List<Dog>> updateDog(Dog dog) async {
    final localStorage = ref.read(localStorageProvider);
    final currentEntry = await getDogs();
    final newEntry = replaceListElementByCondition(
        currentEntry, dog, (element) => element.id == dog.id);
    final serializedNewEntry = jsonEncodeList(newEntry);
    final isSuccess =
        await localStorage.storeList(LocalStorageKey.dogs, serializedNewEntry);
    if (isSuccess) return getDogs();
    throw getException("$LocalDogRepository", "updateDog");
  }

  @override
  Future<List<Dog>> updateDogs(List<Dog> dogList) async {
    final localStorage = ref.read(localStorageProvider);
    final serializedNewEntry = jsonEncodeList(dogList);
    final isSuccess =
        await localStorage.storeList(LocalStorageKey.dogs, serializedNewEntry);
    if (isSuccess) return getDogs();
    throw getException("$LocalDogRepository", "updateDogs");
  }
}
