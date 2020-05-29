import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          primaryColor: Colors.orange,
        ),
        routes: {'/Login': (context) => Login()},
        home: Login());
  }

  _factoryCreateCard(texto) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text('$texto'),
      ),
    );
  }
}
