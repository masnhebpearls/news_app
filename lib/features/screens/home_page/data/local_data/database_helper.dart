import 'package:hive/hive.dart';

import '../../../../../core/constants/constant_helper.dart';

class DatabaseHelper {
  Box<String> getDatabaseInitialized() {
    print("here");
    return Hive.box<String>(ConstantHelper.boxName);
  }
}
