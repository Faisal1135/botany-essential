import 'package:botany_essential/constant.dart';

import 'package:hive/hive.dart';
import '../models/botmodel.dart';

Map<dynamic, Botmodel> findArgByTerm(String term) {
  final box = Hive.box<Botmodel>(kbotBox);
  final allbot = box.values.toList();

  for (var i = 0; i < box.values.length; i++) {
    if (allbot[i].term == term) {
      var _key = box.keyAt(i);
      return {_key: allbot[i]};
    }
  }
}
