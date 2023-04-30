enum AppFlavor { dev, prod }

class AppFlavorConfig {
  static AppFlavorConfig? _instance;
  AppFlavor? appFlavor;
  String? baseUrl;
  String? fetchNews;
  bool? isDevelopment;

  static AppFlavorConfig? get instance => _instance;
  AppFlavorConfig();
  static void setFlavor({
    AppFlavor? flavor = AppFlavor.dev,
  }) {
    if (_instance == null) {
      var baseFlavor =
          flavor == AppFlavor.dev ? AppDevFlavor() : AppProdFlavor();
      _instance?.appFlavor = flavor;
      _instance?.baseUrl = baseFlavor.baseUrl;
      _instance?.fetchNews = baseFlavor.fetchNews;
    }
  }
}

abstract class BaseFlavor {
  AppFlavor get appFlavor => AppFlavor.prod;
  String baseUrl = '';
  String fetchNews = '';
}

class AppDevFlavor extends BaseFlavor {
  @override
  AppFlavor get appFlavor => AppFlavor.dev;
  @override
  String get baseUrl => '';
  @override
  String get fetchNews => '';
}

class AppProdFlavor extends BaseFlavor {
  @override
  AppFlavor get appFlavor => AppFlavor.prod;
  @override
  String get baseUrl => '';
  @override
  String get fetchNews => '';
}
