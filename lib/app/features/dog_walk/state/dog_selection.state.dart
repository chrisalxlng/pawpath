import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pawpath/app/domain/dog/dog_repository.local.dart";
import "package:pawpath/app/models/dog/dog.dart";
import "package:pawpath/app/util.dart";

final dogSelectionListProvider =
    AsyncNotifierProvider.autoDispose<DogSelectionList, List<Dog>>(() {
  return DogSelectionList();
});

class DogSelectionList extends AutoDisposeAsyncNotifier<List<Dog>> {
  final _repositoryType = localDogRepository;

  @override
  Future<List<Dog>> build() async {
    return await ref.read(_repositoryType).getDogs();
  }

  Future<void> submit(List<Dog> list) async {
    final repository = ref.read(_repositoryType);
    await repository.updateDogs(list);
  }

  Future<void> toggleSelection(List<Dog> list, Dog dog) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => Future(() =>
        replaceListElementByCondition(
            list,
            dog.copyWith(isSelected: !dog.isSelected),
            (element) => element.id == dog.id)));
  }
}
