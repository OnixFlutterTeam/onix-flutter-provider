import 'package:get_it/get_it.dart';

import 'base_provider_example/provider/base_provider_example_screen_provider.dart';

void initializeDi(GetIt getIt) {
  // Registering the Provider class
  getIt.registerFactory<BaseProviderExampleScreenProvider>(
      BaseProviderExampleScreenProvider.new);
}
