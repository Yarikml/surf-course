import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  final String title;

  const CounterPage({required this.title, Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  int _incrementTapped = 0;
  int _decreasedTapped = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 1;
      _incrementTapped += 1;
    });
  }

  void _decreaseCounter() {
    if (_counter > 0) {
      setState(() {
        _counter -= 1;
        _decreasedTapped += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                'Increment button tapped $_incrementTapped times',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Text(
              'Decrease button tapped $_decreasedTapped times',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: FloatingActionButton(
              onPressed: _decreaseCounter,
              tooltip: 'Decrease',
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
