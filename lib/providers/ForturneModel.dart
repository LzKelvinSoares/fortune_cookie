import 'dart:math';

import 'package:flutter/material.dart';

class FortuneModel extends ChangeNotifier {

  String _currentFortune = "";

  var fortuneList = [
    "You'll find a new friend",
    "You'll find a new friend tomorrow",
    "Adventure can be real happiness",
  ];

  String get currentFortune => _currentFortune;

  FortuneModel() {
    _generateRandomFortune();
  }

  void _generateRandomFortune() {
    var random = Random();
    int randomNumber = random.nextInt(fortuneList.length);
    _currentFortune = fortuneList[randomNumber];

    notifyListeners();
  }

  // Method to get a random fortune from the list
  void getRandomFortune() {
    _generateRandomFortune();
  }
}