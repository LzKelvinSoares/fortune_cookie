import 'dart:math';

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
        colorScheme: .fromSeed(seedColor: Colors.lightGreen),
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
  String _fortuneTitle = "";
  final _fortuneList = [
    "You'll find a new friend",
    "You'll find a new friend tomorrow",
    "Adventure can be real happiness",
  ];

  void _randomFortune() {
    setState(() {
      int randomNumber = Random().nextInt(_fortuneList.length);
      _currentFortune = _fortuneList[randomNumber];
      _fortuneTitle = "Your fortune is:";
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
            Image.asset(
              'assets/images/fortune_cookie.png', 
              width: 200, 
              height: 200, 
              fit: BoxFit.cover,
            ),
            Card(child:  
                _fortuneTitle.isNotEmpty ? 
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    '${_currentFortune}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ) : Text(""),
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
