import 'package:flutter/material.dart';
import 'package:flutter_learning/model/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainApp extends StatelessWidget {
  const MainApp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: const MyPageDemo(),
    );
  }
}

class MyPageDemo extends StatelessWidget {
  const MyPageDemo();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage();

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);//context.bloc<CounterBloc>();
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              child: const Text(
                "+1",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25
                ),
              ),
              onPressed: () => counterBloc.add(CounterEvent.increment),
            ),
            BlocBuilder<CounterBloc,int>(
              builder: (context, count) =>
                  Text(
                    "$count",
                    style: const TextStyle(
                      fontSize: 30,
                    ),
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
              onPressed: () => counterBloc.add(CounterEvent.decrement)
            ),
          ],
        ),
      ),
    );
  }
}