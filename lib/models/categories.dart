import 'package:hive/hive.dart';

part 'categories.g.dart';

@HiveType(typeId: 4)
class Category extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late List<int> conseilsIds;

  Category({required this.name, required this.conseilsIds});
}
