import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            // leading: ,
            // centerTitle: ,
            // title: ,
            ),
        backgroundColor: Colors.grey.shade100,
        body: Container(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (ctx, index) {
              return _factoryCreateCard('Ola ');
            },
          ),
        ),
      ),
    );
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
