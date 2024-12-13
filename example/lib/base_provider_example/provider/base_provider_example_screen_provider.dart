import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';
import 'package:onix_flutter_provider/onix_flutter_provider.dart';

class BaseProviderExampleScreenProvider extends BaseProvider {
  int counter = 0;

  BaseProviderExampleScreenProvider() : super();

  void incrementCounter() {
    counter++;

    onFailure(ApiFailure(ServerFailure.unknown));
    showProgress();
    hideProgress();

    notifyListeners();
  }
}
