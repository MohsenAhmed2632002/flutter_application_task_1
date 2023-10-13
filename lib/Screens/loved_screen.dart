import 'package:flutter/material.dart';
import 'package:flutter_application_task_1/Models/liked_model.dart';
import 'package:provider/provider.dart';

class LovedScreen extends StatefulWidget {
  LovedScreen({super.key});

  @override
  State<LovedScreen> createState() => _LovedScreenState();
}

class _LovedScreenState extends State<LovedScreen> {
  final LikedModel likedModel = LikedModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "you have ${context.watch<LikedModel>().listOflikedWord.length} in your List",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 147, 147, 147),
      ),
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<LikedModel>(
            builder: (BuildContext context, value, Widget? child) {
              return Container(
                color: Colors.white,
                height: MediaQuery.sizeOf(context).height * 0.8,
                width: MediaQuery.sizeOf(context).width,
                child: ListView.builder(
                  itemCount: context.watch<LikedModel>().listOflikedWord.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        context.watch<LikedModel>().listOflikedWord[index],
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
