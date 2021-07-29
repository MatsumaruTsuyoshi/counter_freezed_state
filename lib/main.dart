import 'package:counter_freezed_state/counter_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  //ProviderScopeで包んであげることによっって、状態を監視できるようになる
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    //controllerはCounterStateController型なので、increment()を実行できる。
    final controller = useProvider(counterStateControllerProvider.notifier);

    //dataはCounterState型であり、count、count10を監視している。
    final data =
        useProvider(counterStateControllerProvider.select((value) => value));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ボタンを押すと数字が増えていくよ',
            ),
            Text('数字が1ずつ増える : ${data.count}'),
            Text('数字が10ずつ増える : ${data.count10}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //CounterStateControllerのincrement()を実行している。
          controller.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// flutter pub run build_runner build --delete-conflicting-outputs
