import 'package:onix_flutter_provider/onix_flutter_provider.dart';

class BaseProviderExampleScreenProvider extends BaseProvider {
  int counter = 0;

  BaseProviderExampleScreenProvider() : super();

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
