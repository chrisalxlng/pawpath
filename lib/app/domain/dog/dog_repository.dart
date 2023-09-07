import "package:pawpath/app/models/dog/dog.dart";

abstract class DogRepository {
  Dog addDog(Dog dog);
  List<Dog> getDogs();
  void removeDog(String id);
  Dog updateDog(Dog dog);
}
