import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteIndustryManager {
  late SharedPreferences pref = Get.find();

  static const String PREF_KEY_FAVORITE_LIST = "PREF_KEY_FAVORITE_LIST";

  final _rxFavorites = RxList<String>(const []);
  List<String> get favorites => _rxFavorites;
  set favorites(List<String> value) {
    _rxFavorites.value = value;
  }

  void addToFavorite(String codename) async {
    _rxFavorites.add(codename);
    await pref.setStringList(PREF_KEY_FAVORITE_LIST, _rxFavorites);
    _rxFavorites.refresh();
  }

  void removeFavorite(String codename) async {
    _rxFavorites.remove(codename);
    await pref.setStringList(PREF_KEY_FAVORITE_LIST, _rxFavorites);
    _rxFavorites.refresh();
  }

  bool isAlreadyFavorite(String codename) => _rxFavorites.contains(codename);
}
