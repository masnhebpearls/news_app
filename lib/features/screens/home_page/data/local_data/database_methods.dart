import 'package:news_app/features/screens/home_page/data/local_data/database_helper.dart';

class DatabaseMethods extends DatabaseHelper {

  void storeData(String jsonString, String key) {
    final data = jsonString;
    final box = getDatabaseInitialized();
    box.put(key, data);
  }

  void deleteData(String key) async {
    final box = getDatabaseInitialized();
    box.delete(key);
  }

  List<String> getStoredData()  {
    final box = getDatabaseInitialized();
    final savedList =  box.values.toList();
    return savedList;
  }

}