// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  bool isVisible = true;
  List<int> numbers = [];

  void addCounter() {
    setState(() {
      counter = counter + 1;
    });

    // 이렇게 쓰는 방법도 있음. 똑같이 작동하지만 위를 추천 (명확성)
    // counter = counter + 1;
    // setState(() {});
  }

  void subCounter() {
    setState(() {
      counter = counter - 1;
    });
  }

  void addList() {
    setState(() {
      numbers.add(counter);
    });
    // print(numbers);
  }

  void toggleVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ), 
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xfff4edd8),
        body: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isVisible) ...[
                      const ClickCount(),
                      IconButton(
                        iconSize: 40,
                        onPressed: toggleVisible,
                        icon: const Icon(Icons.visibility_off),
                      ),
                    ] else ...[
                      const Text('nothing to see'),
                      IconButton(
                        iconSize: 40,
                        onPressed: toggleVisible,
                        icon: const Icon(Icons.visibility),
                      ),
                    ]
                  ],
                ),
                Text(
                  '$counter',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 40,
                      onPressed: addCounter,
                      icon: const Icon(Icons.add_box_rounded),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      iconSize: 40,
                      onPressed: subCounter,
                      icon: const Icon(Icons.remove_circle),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      iconSize: 40,
                      onPressed: addList,
                      icon: const Icon(Icons.check_box),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "[",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    for (var n in numbers)
                      Text(
                        '$n ,',
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    const Text(
                      "]",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClickCount extends StatefulWidget {
  const ClickCount({
    super.key,
  });

  @override
  State<ClickCount> createState() => _ClickCountState();
}

class _ClickCountState extends State<ClickCount> {
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Text(
      "Click Count",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
