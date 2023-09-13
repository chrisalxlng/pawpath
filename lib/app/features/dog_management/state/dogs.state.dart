import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pawpath/app/domain/dog/dog_repository.local.dart";
import "package:pawpath/app/models/dog/dog.dart";

final dogListProvider =
    AsyncNotifierProvider.autoDispose<DogList, List<Dog>>(() {
  return DogList();
});

class DogList extends AutoDisposeAsyncNotifier<List<Dog>> {
  final _repositoryType = localDogRepository;

  Future<void> addDog(Dog dog) async {
    final repository = ref.read(_repositoryType);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.addDog(dog));
  }

  @override
  Future<List<Dog>> build() async {
    return await ref.read(_repositoryType).getDogs();
  }

  Future<Dog> getDog(String id) async {
    final repository = ref.read(_repositoryType);
    return repository.getDog(id);
  }

  Future<void> removeDog(String id) async {
    final repository = ref.read(_repositoryType);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.removeDog(id));
  }

  Future<void> updateDog(Dog dog) async {
    final repository = ref.read(_repositoryType);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.updateDog(dog));
  }
}
