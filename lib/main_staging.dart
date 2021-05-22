import 'config/flavor_config.dart';
import 'main_common.dart';

/// for staging flavor
void main() {
  FlavorConfig(
    flavor: Flavor.STAGING,
    values: const FlavorValues(
      env: Env(
          baseUrl: 'https://api.themoviedb.org/3',
          apiKey: '7d1053fff77e5cfb9c858cb285cecc19'),
    ),
  );

  mainCommon();
}
