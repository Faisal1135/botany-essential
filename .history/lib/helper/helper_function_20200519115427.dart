import '../models/botmodel.dart';
import 'package:hive/hive.dart';

import '../constant.dart';

class HelperFunction {
  static Future<void> togglefavorite(int index) async {
    final botbox = Hive.box<Botmodel>(kbotBox);
    final key = botbox.keyAt(index);
    final bot = botbox.get(key);
    if (bot.isFavorite) {
      bot.isFavorite = false;
    } else {
      bot.isFavorite = true;
    }
    await botbox.put(key, bot);
  }

  static List<Botmodel> findWithAlpha(String alpha) {
    final allList = Hive.box<Botmodel>(kbotBox).values.toList();
    final startsWithAlpha = allList
        .where((bot) => bot.term.toLowerCase().startsWith(alpha))
        .toList();
    return startsWithAlpha;
  }
}
