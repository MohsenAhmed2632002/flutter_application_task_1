import 'package:flutter/material.dart';
import 'package:flutter_application_task_1/Models/liked_model.dart';
import 'package:provider/provider.dart';

class AllListScreen extends StatefulWidget {
  const AllListScreen({super.key});

  @override
  State<AllListScreen> createState() => _AllListScreenState();
}

class _AllListScreenState extends State<AllListScreen> {
  List<String> allWordList = [
    "Word1",
    "Word2",
    "Word3",
    "Word4",
    "Word5",
    "Word6",
    "Word7",
    "Word8",
    "Word9",
    "Word10",
  ];

  late int index = 0;
  @override
  Widget build(BuildContext context) {
    var isIn = context.select<LikedModel, bool>(
        (list) => list.listOflikedWord.contains(allWordList[index]));
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 147, 147, 147),
          centerTitle: true,
          title: Text(
            "AllList",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 147, 147, 147),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
              child: Text(
                "${allWordList[index]}",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (index == 0) {
                      setState(() {
                        index = 9;
                      });
                    } else {
                      setState(() {
                        index--;
                      });
                    }
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    isIn
                        ? context
                            .read<LikedModel>()
                            .remove(word: '${allWordList[index]}')
                        : context
                            .read<LikedModel>()
                            .addWord(word: '${allWordList[index]}');
                  },
                  icon: isIn
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite_border,
                        ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (index == 9) {
                      setState(() {
                        index = 0;
                      });
                    } else {
                      setState(() {
                        index++;
                      });
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
