import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Counterprovider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assingment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Assingment'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var counter = context.read<Counterprovider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<Counterprovider>(
              builder: (context, counter, child) => 
              Text( counter.counter.toString(),
                style: Theme.of(context).textTheme.headline4),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 FloatingActionButton(
                  tooltip: 'decrement',
                   child: const Icon(Icons.exposure_minus_1),
              onPressed: () {
                var counter = context.read<Counterprovider>();
                counter.decrement();
              }
              ,
                    ) , 
                    FloatingActionButton(
                        tooltip: 'reset',
                        child: const Icon(Icons.restore_from_trash),
              onPressed: () {
                var counter = context.read<Counterprovider>();
                counter.reset();
              },
                    ),
                     FloatingActionButton(
                         tooltip: 'Increment',
                         child: const Icon(Icons.add),
              onPressed: () {
                var counter = context.read<Counterprovider>();
                counter.increment();
              },
                    ) 
                     ],
            )
            
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          var counter = context.read<Counterprovider>();
          counter.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    
    );
  }
}

