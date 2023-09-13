import "package:pawpath/app/models/dog/dog.dart";

abstract class DogRepository {
  Future<List<Dog>> addDog(Dog dog);
  Future<List<Dog>> getDogs();
  Future<List<Dog>> removeDog(String id);
  Future<List<Dog>> updateDog(Dog dog);
  Future<List<Dog>> updateDogs(List<Dog> dogList);
}
