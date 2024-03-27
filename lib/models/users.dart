import 'package:hive/hive.dart';

part 'users.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  User();
}
