enum Flavor { DEV, STAGING, PRODUCTION }

class Env {
  final String baseUrl;
  final String apiKey;
  const Env({required this.baseUrl, required this.apiKey});
}

class FlavorValues {
  const FlavorValues({required this.env});

  final Env env;
}

class FlavorConfig {
  final Flavor flavor;
  late FlavorValues values;

  static late final FlavorConfig _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues values,
  }) {
    _instance = FlavorConfig._internal(flavor, values);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.values);

  static FlavorConfig get instance {
    return _instance;
  }

  static Env get env => instance.values.env;

  static bool get isProduction => _instance.flavor == Flavor.PRODUCTION;

  static bool get isDevelopment => _instance.flavor == Flavor.DEV;

  static bool get isQA => _instance.flavor == Flavor.STAGING;
}
