import 'package:hive/hive.dart';

part 'conseils.g.dart';

@HiveType(typeId: 1)
class Conseil extends HiveObject {
  @HiveField(0)
  late String titre;

  @HiveField(1)
  late String description;

  @HiveField(2)
  late String image;

  @HiveField(3)
  late bool favori;

  Conseil(this.titre, this.description, this.image, this.favori);
}
