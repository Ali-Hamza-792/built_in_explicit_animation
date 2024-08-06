import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;
  final Tween<double> tween = Tween<double>(begin: 0, end: 1);
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = tween.animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      // _counter++;
      _animationController.repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RotationTransition(
                turns: _animation,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(50),
                  ),
                )),
            SizedBox(
                height: 200,
                width: 300,
                child: Card(
                  margin: EdgeInsets.all(8.0),
                  surfaceTintColor: Colors.cyanAccent,
                  color: Colors.blue,
                  elevation: 40,
                  shape:
                      Border.all(color: Colors.black, style: BorderStyle.solid),
                )),
            // RotationTransition(
            //   turns: _animation,
            //   child: const Text(
            //     'You have pushed the button this many times:',
            //   ),
            // ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: _decrementCounter,
              child: const Text(
                "Stop",
                style: TextStyle(fontSize: 30),
              ),
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text(
                "Rotate",
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _decrementCounter() {
    setState(() {
      _animationController.stop();
    });
  }
}
