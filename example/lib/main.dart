import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'base_provider_example/base_provider_example_screen.dart';
import 'di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDi(GetIt.I);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) =>
              const BaseProviderExampleScreen(title: 'Base Provider Example'),
        },
      ),
    );
  }
}
