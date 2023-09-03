import 'package:flutter/material.dart';
import 'package:pawpath/app/themes.dart';

class Counter extends StatefulWidget {
  final String title;

  const Counter({super.key, required this.title});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundPrimary(context),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${widget.title} - You have pushed the button this many times:",
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
