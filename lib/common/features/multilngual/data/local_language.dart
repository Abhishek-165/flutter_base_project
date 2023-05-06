import 'package:shared_preferences/shared_preferences.dart';

class LocalLanguage {
  SharedPreferences? prefs;

  String languagePrefsKey = 'languagePrefs';
  static final LocalLanguage _singleton = LocalLanguage._internal();
  LocalLanguage._internal();

  static LocalLanguage getInstance() => _singleton;

  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String? readValue() {
    try {
      String? local = prefs?.getString(languagePrefsKey);
      return local;
    } catch (e) {
      return null;
    }
  }

  storeKey(String languageCode) async {
    await prefs?.setString(languagePrefsKey, languageCode);
  }
}
