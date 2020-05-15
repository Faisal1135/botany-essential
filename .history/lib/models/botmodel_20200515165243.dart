import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'botmodel.g.dart';

@HiveType(typeId: 1)
class Botmodel {
  @HiveField(0)
  String id;
  // Hive fields go here

  @HiveField(1)
  String term;

  @HiveField(2)
  List<String> meaning;

  @HiveField(3)
  List<String> innerLink;

  Botmodel({this.term, this.meaning, this.innerLink, this.id});

  Botmodel.fromJson(Map<String, dynamic> json)
      : id = Uuid().v4(),
        term = json["term"] as String,
        meaning = json["meaning"] as List<String>,
        innerLink = json["inner_link"];
}
// class BotModel {

//   final String term;
//   final List<String> meaning;
//   final List<String> innerLink;

//   BotModel(this.term, this.meaning, this.innerLink);

// }
