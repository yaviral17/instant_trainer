import 'package:get_storage/get_storage.dart';

class LocalStorage {
  // initialize the local storage
  final box = GetStorage("it");

  // save Map<String, dynamic> data to local storage
  void saveData(String key, Map<String, dynamic> data) {
    box.write(key, data);
  }

  // get Map<String, dynamic> data from local storage
  Map<String, dynamic>? getData(String key) {
    return box.read(key);
  }

  // delete data from local storage
  void deleteData(String key) {
    box.remove(key);
  }

  // clear all data from local storage
  void clearData() {
    box.erase();
  }

  // check if data exists in local storage
  bool dataExists(String key) {
    return box.hasData(key);
  }

  // get all keys from local storage
  List<String> getAllKeys() {
    return box.getKeys().toList();
  }

  // get all data from local storage
  Map<String, dynamic> getAllData() {
    Map<String, dynamic> allData = {};
    for (String key in box.getKeys()) {
      allData[key] = box.read(key);
    }
    return allData;
  }
}
