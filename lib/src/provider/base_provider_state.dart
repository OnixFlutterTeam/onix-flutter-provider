import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:onix_flutter_core_models/onix_flutter_core_models.dart';
import 'package:onix_flutter_provider/src/domain/entity/progress_state/progress_state.dart';
import 'package:onix_flutter_provider/src/provider/base_provider.dart';
import 'package:provider/provider.dart';

typedef StateListener<P> = Widget Function(P provider);

abstract class BaseProviderState<P extends BaseProvider,
    W extends StatefulWidget> extends State<W> {
  bool lazyProvider = false;
  bool _listenersAttached = false;
  P? _provider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<P>(
      create: (ctx) {
        final provider = createProvider();
        _provider = provider;
        onProviderCreated(context, provider);
        _attachListeners(context);
        return provider;
      },
      lazy: lazyProvider,
      child: Builder(
        builder: (context) {
          if (!_listenersAttached) {
            _listenersAttached = true;
            _attachListeners(context);
          }
          initParams(context);
          return buildWidget(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    if (context.mounted) {
      context.loaderOverlay.hide();
    }
    super.dispose();
  }

  P providerOf(BuildContext context) => context.read<P>();

  P createProvider();

  Widget providerConsumer({
    required StateListener<P> stateListener,
  }) {
    return Consumer<P>(
      builder: (_, provider, __) => stateListener(provider),
    );
  }

  void onProviderCreated(BuildContext context, P provider) {}

  void onFailure(BuildContext context, Failure failure) {}

  void onProgress(BuildContext context, BaseProgressState progress) {
    if (progress is DefaultProgressState) {
      if (progress.showProgress) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    }
  }

  // ignore: no-empty-block
  void initParams(BuildContext context) {}

  Widget buildWidget(BuildContext context);

  void _attachListeners(BuildContext context) {
    _provider?.failureStream.listen((failure) {
      if (!context.mounted) return;
      onFailure(context, failure);
    });

    _provider?.progressStream.listen((progress) {
      if (!context.mounted) return;
      onProgress(context, progress);
    });
  }
}
