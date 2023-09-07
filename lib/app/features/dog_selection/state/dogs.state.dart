import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pawpath/app/domain/dog/dog_repository.mock.dart";
import "package:pawpath/app/models/dog/dog.dart";

final dogListProvider = NotifierProvider<DogList, List<Dog>>(() {
  return DogList();
});

final selectedDogListProvider = StateProvider<List<Dog>>((ref) {
  final selectedDogs =
      ref.watch(dogListProvider).where((dog) => dog.isSelected).toList();
  return selectedDogs;
});

class DogList extends Notifier<List<Dog>> {
  final _repository = mockDogRepository;

  void add(Dog dog) {
    ref.read(_repository).addDog(dog);
  }

  @override
  List<Dog> build() {
    return ref.read(_repository).getDogs();
  }

  void remove(Dog dog) {
    ref.read(_repository).removeDog(dog.id);
    state = state.where((element) => dog != element).toList();
  }

  void update(Dog dog) {
    final updatedDog = ref.read(_repository).updateDog(dog);
    final updatedDogIndex = state.indexWhere((element) => element.id == dog.id);
    final newState = [...state];
    newState.replaceRange(updatedDogIndex, updatedDogIndex + 1, [updatedDog]);
    state = newState;
  }
}
