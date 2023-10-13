import 'package:flutter/material.dart';

class LikedModel extends ChangeNotifier {
  List<String> listOflikedWord = [];
      
  addWord({required String word}) {
    listOflikedWord.add(word);
    notifyListeners();
  }

  remove({required String word}) {
    listOflikedWord.remove(word);
    notifyListeners();
  }

}
