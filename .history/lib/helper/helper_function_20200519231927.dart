import '../models/botmodel.dart';
import 'package:hive/hive.dart';

import '../constant.dart';

class HelperFunction {
  static Future<void> togglefavorite(String term) async {
    final botbox = Hive.box<Botmodel>(kbotBox);

    var bot = botbox.get(term);
    bot.isFavorite = !bot.isFavorite;
    botbox.put(term, bot);
  }

  static List<Botmodel> findWithAlpha(String alpha) {
    final allList = Hive.box<Botmodel>(kbotBox).values.toList();
    final startsWithAlpha = allList
        .where((bot) => bot.term.toLowerCase().startsWith(alpha))
        .toList();
    return startsWithAlpha;
  }
}
