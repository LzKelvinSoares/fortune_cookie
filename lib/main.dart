import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
const String EMPTY_FORTUNE_MESSAGE = "Click the button to see your fortune";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentFortune = "";
  String _fortuneTitle = EMPTY_FORTUNE_MESSAGE;
  final _fortuneList = [
    "You'll find a new friend",
    "You'll find a new friend tomorrow",
    "Adventure can be real happiness",
  ];

  void _randomFortune() {
    setState(() {
      int randomNumber = Random().nextInt(_fortuneList.length);
      _currentFortune = _fortuneList[randomNumber];
      _fortuneTitle = _currentFortune.isNotEmpty ? "Your fortune is:" : EMPTY_FORTUNE_MESSAGE;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              '${_fortuneTitle}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Card(child:  
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    '${_currentFortune}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
            ),
            ElevatedButton(onPressed: _randomFortune, child: Icon(Icons.shuffle)),
           
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _randomFortune,
      //   tooltip: 'Get luck',
      //   child: const Icon(Icons.shuffle),
      // ),
    );
  }
}
