// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gdzie pomiziać dzisiaj kotka?'),
          backgroundColor: Color.fromARGB(255, 180, 122, 122),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Gdzie pomiziać dzisiaj kotka?'),
            SizedBox(height: 20),
            Image(
              image: AssetImage('images/kotek.jpeg'),
              width: 300,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 180, 122, 122),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SecondPage(),
                  ),
                );
              },
              child: Text('Sprawdź'),
            ),
          ]),
        ));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final result = random.nextBool();
    return Scaffold(
        appBar: AppBar(
          title: Text('Sprawdź co wyszło!'),
          backgroundColor: result == true ? Colors.pinkAccent : Colors.purple,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (result == true) Text('USZKA'),
            if (result == false) Text('BRÓDKA'),
            SizedBox(height: 20),
            if (result == true)
              Image(
                image: AssetImage('images/uszka.jpg'),
                width: 300,
              ),
            SizedBox(
              height: 20,
            ),
            if (result == false)
              Image(
                image: AssetImage('images/bróddka.jpg'),
                width: 300,
              ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    result == true ? Colors.pinkAccent : Colors.purple,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Spróbuj ponownie'),
            ),
          ]),
        ));
  }
}
