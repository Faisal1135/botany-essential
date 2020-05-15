import 'package:hive/hive.dart';

part 'botmodel.g.dart';

@HiveType()
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

  Botmodel({this.term, this.meaning, this.innerLink});
}
// class BotModel {

//   final String term;
//   final List<String> meaning;
//   final List<String> innerLink;

//   BotModel(this.term, this.meaning, this.innerLink);

// }
