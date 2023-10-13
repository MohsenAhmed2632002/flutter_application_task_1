import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_task_1/Models/liked_model.dart';
import 'package:flutter_application_task_1/Screens/AllListScreen.dart';
import 'package:flutter_application_task_1/Screens/loved_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LikedModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 234, 234, 234),
          ),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 1;
  List ScreenList = [
    LovedScreen(),
    AllListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenList[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        onTap: (Index) {
          setState(
            () {
              currentIndex = Index;
            },
          );
        },
        buttonBackgroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        color: Colors.black26,
        items: const [
          Icon(
            Icons.format_list_numbered,
          ),
          Icon(
            Icons.production_quantity_limits_rounded,
          ),
        ],
      ),
    );
  }
}
