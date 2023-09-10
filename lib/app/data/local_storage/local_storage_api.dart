import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pawpath/app/app.dart";
import "package:pawpath/app/data/local_storage/local_storage_keys.dart";
import "package:shared_preferences/shared_preferences.dart";

final localStorageProvider = Provider((ref) => LocalStorageApi(ref));

class LocalStorageApi {
  late SharedPreferences _prefs;

  LocalStorageApi(ProviderRef ref) {
    _prefs = ref.watch(sharedPreferencesProvider);
  }

  Future<bool> clear() {
    return _prefs.clear();
  }

  String? getItem(LocalStorageKey key) {
    return _prefs.getString(key.name);
  }

  List<String>? getList(LocalStorageKey key) {
    return _prefs.getStringList(key.name);
  }

  Future<bool> removeItem(LocalStorageKey key) {
    return _prefs.remove(key.name);
  }

  Future<bool> storeItem(LocalStorageKey key, String value) {
    return _prefs.setString(key.name, value);
  }

  Future<bool> storeList(LocalStorageKey key, List<String> value) {
    return _prefs.setStringList(key.name, value);
  }
}
