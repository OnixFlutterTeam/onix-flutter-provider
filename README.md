This package contains some base classes designed to improve experience of using Provider state
management.

### Provider

Extend you Provider class from `BaseProvider`:

```
class ExampleScreenProvider extends BaseProvider
```

Extend you widget from `BaseProviderState`

```
class _ExampleScreenState extends BaseProviderState<ExampleScreenProvider, ExampleScreen> {
```

Create Provider instance in `createProvider` function:

```
 ExampleScreenProvider createProvider() => ExampleScreenProvider();
```

Write you widget body in `buildWidget` instead of `build`

```
  @override
  Widget buildWidget(BuildContext context) {
  	return Scaffold(...);
  }
```

It is also possible to override the onFailure method to handle failure objects:

```
@override
void onFailure(
  BuildContext context,
  Failure failure,
) {
  ...
}
```

and even onProgress to implement custom progress state behaviour:

```
@override
void onProgress(
  BuildContext context,
  BaseProgressState progress,
) {
  ...
}
```

The `providerConsumer` method is used to create a widget in response to new states:

```
providerConsumer(
    stateListener: (provider) => MyWidget(...),
}
```

You can also use the widget classes `Consumer`, `Selector` from
the `provider` package without any restrictions
