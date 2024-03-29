import 'package:hive/hive.dart';

@HiveType(typeId: 4)
class Document extends HiveObject {
  @HiveField(0)
  late String titre;

  @HiveField(1)
  late String image;

  Document(this.titre, this.image);
}
