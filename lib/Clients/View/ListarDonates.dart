import 'package:flutter/material.dart';
import 'package:help_others/Clients/Controller/ClientController.dart';
import 'package:help_others/ReusableWidgets/DrawerDraw.dart';
import 'package:help_others/ReusableWidgets/GradientWidgets.dart';
import 'package:help_others/main.dart';

class ListDonate extends StatefulWidget {
  @override
  _ListDonateState createState() => _ListDonateState();
}

class _ListDonateState extends State<ListDonate> {
  ClientController controllerAPI = new ClientController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: DrawerDraw(),
      appBar: new AppBar(
        actions: [
          LinearGradientItens(
              child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/ClientHomePage');
            },
            color: Colors.blue,
            iconSize: 35,
          ))
        ],
        centerTitle: true,
        title: LinearGradientItens(
            child: Text(
          'Listagem de Doações',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: FutureBuilder(
            future: controllerAPI.getDonates(token),
            builder: (context, snap) {
              return snap.connectionState == ConnectionState.done
                  ? snap.hasData
                      ? ListView.builder(
                          itemBuilder: (context, index) => Card(
                            color: Colors.white,
                            child: ListTile(
                              title: Text(snap.data[index]['donate']),
                              subtitle: Text(snap.data[index]['address']),
                            ),
                          ),
                          itemCount: snap.data.length,
                        )
                      : Text('Nao ha dados')
                  : CircularProgressIndicator();
            }),
      ),
    );
  }
}
