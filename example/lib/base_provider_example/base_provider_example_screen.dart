import 'package:example/base_provider_example/provider/base_provider_example_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:onix_flutter_provider/onix_flutter_provider.dart';
import 'package:provider/provider.dart';

class BaseProviderExampleScreen extends StatefulWidget {
  final String title;
  const BaseProviderExampleScreen({
    required this.title,
    super.key,
  });

  @override
  State<BaseProviderExampleScreen> createState() =>
      _BaseProviderExampleScreenState();
}

class _BaseProviderExampleScreenState extends BaseProviderState<
    BaseProviderExampleScreenProvider, BaseProviderExampleScreen> {
  @override
  BaseProviderExampleScreenProvider createProvider() {
    return BaseProviderExampleScreenProvider();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              providerConsumer(stateListener: (provider) {
                return Text(
                  '${provider.counter}',
                  style: Theme.of(context).textTheme.displayMedium,
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          providerOf(context).incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
