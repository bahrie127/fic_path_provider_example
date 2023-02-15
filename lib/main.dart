import 'package:flutter/material.dart';
import 'package:flutter_binar_writeread_files/counter_file_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Binar Read Write Files'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _getDataCounter() async {
    _counter = await CounterFileStorage().readCounter();
    setState(() {});
  }

  void _incrementCounter() async {
    await CounterFileStorage().writeCounter(++_counter);
    _getDataCounter();
  }

  void _decrementCounter() async {
    await CounterFileStorage().writeCounter(--_counter);
    _getDataCounter();
  }

  void _removeCounter() async {
    await CounterFileStorage().writeCounter(0);
    _getDataCounter();
  }

  @override
  void initState() {
    super.initState();
    _getDataCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter example from directory',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _decrementCounter, child: const Text('-')),
                const SizedBox(width: 8),
                ElevatedButton(
                    onPressed: _incrementCounter, child: const Text('+'))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                _removeCounter();
              },
              child: const Text('Clear'),
            )
          ],
        ),
      ),
    );
  }
}
