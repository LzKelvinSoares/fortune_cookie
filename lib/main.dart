import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fortune_cookie/providers/ForturneModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => FortuneModel(),
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final fortune = Provider.of<FortuneModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fortune Cookie App"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/fortune_cookie.png', 
              width: 200, 
              height: 200, 
              fit: BoxFit.cover,
            ),
            Card(child:  
                fortune.currentFortune.isNotEmpty ? 
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    fortune.currentFortune,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ) : Text(""),
            ),
            ElevatedButton(onPressed: () => fortune.getRandomFortune(), child: Icon(Icons.shuffle)),
           
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
