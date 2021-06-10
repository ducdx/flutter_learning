import 'package:flutter/material.dart';
import '../model/counter.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage();

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => counter.increment(),
              child: const Text(
                "+1",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25
                ),
              ),
            ),
            Text(
              "${counter.currentCount}",
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            TextButton(
              child: const Text(
                "-1",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25
                ),
              ),
              onPressed: () => counter.decrement(),
            )
          ],
        ),
      ),
    );
  }
}