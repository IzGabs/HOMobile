import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:help_others/Clients/Controller/ClientController.dart';
import 'package:help_others/ReusableWidgets/DrawerDraw.dart';
import 'package:help_others/ReusableWidgets/GradientWidgets.dart';
import 'package:help_others/main.dart';

class DoacaoGeral extends StatefulWidget {
  DoacaoGeral({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ToDoListState createState() => ToDoListState();
}

class ToDoListState extends State<DoacaoGeral> {
  ClientController controllerAPI = new ClientController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDraw(),
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
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
          'Listagem de Produtos',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: buildBody(),
      floatingActionButton: SpeedDial(
        curve: Curves.bounceOut,
        backgroundColor: Colors.blue,
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.white30,
        children: [
          SpeedDialChild(
              ///Todo ROUTE PRA DOAÇÃO EFETIVA
              child: Icon(Icons.monetization_on),
              label: 'Doação Monetária',
              labelStyle: TextStyle(fontSize: 18.0),
              backgroundColor: Colors.green,
              foregroundColor: Colors.black,
              onTap: () {
                Navigator.pushNamed(context, '/DoacaoMonetaria');
              }),
          SpeedDialChild(
              ///Todo ROUTE PRA DOAÇÃO MONETARIA
              child: Icon(Icons.check),
              label: "Doação Padrão",
              labelStyle: TextStyle(fontSize: 18.0),
              backgroundColor: Colors.green,
              foregroundColor: Colors.black,
              onTap: () {
                Navigator.pushNamed(context, '/DoacaoEfetiva');
              }),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget ownerNameWidget(String value) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text(
                'Nome',
                style: TextStyle(
                  fontSize: 17.07,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget statusWidget(String value2) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text(
                'Sobre',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                value2,
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget toDo(Map doc) {
    return Card(
      child: Container(
          margin: EdgeInsets.all(10.0),
          decoration:
              BoxDecoration(shape: BoxShape.rectangle, color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(
                  10.0,
                ),
                child: Text(','),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ownerNameWidget(doc['item']),
                    statusWidget(doc['tipo']),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget buildBody() {
    return Center(
      child: FutureBuilder(
          future: controllerAPI.getDonates(token),
          builder: (context, snap) {
            return snap.connectionState == ConnectionState.done
                ? snap.hasData
                    ? ListView.builder(
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            title: Text('Item: ' + snap.data[index]['item']),
                            subtitle: Text('Endereço: ' + snap.data[index]['endereco']),
                            leading: Icon(Icons.art_track),
                            onTap: (){
                            Navigator.pushNamed(context, '/infodonate', arguments: snap.data[index]);
                            },
                          ),
                        ),
                        itemCount: snap.data.length,
                      )
                    : Text('Nao ha dados')
                : CircularProgressIndicator();
          }),
    );
  }

}
class InfoDonate extends StatelessWidget {
  ClientController controllerAPI = new ClientController();
  final Map info;
  InfoDonate({this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){controllerAPI.reservarDoacao(info['url'], token); }, label: Text('Eu quero'), icon: Icon(Icons.thumb_up),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            info['item'],
          ),
          Text(
            info['tipo'],
          ),
          Text(
            info['endereco'],
          ),
        ],
      ),
    );
  }
}

/*


FutureBuilder(
                        future: controllerAPI.getDonates(),
                        builder: (context, snap) {
                          return snap.connectionState == ConnectionState.done
                              ? snap.hasData
                                    ? ListView.builder(
                                          itemBuilder: (context, index) => Card(
                                            child: ListTile(
                                              title: Text('Item: ' + snap.data[index]['item']),
                                              subtitle: Text('Tipo: ' + snap.data[index]['tipo']),
                                              leading: Icon(Icons.art_track),
                                            ),
                                          ),
                                        itemCount: snap.data.length,
                                      )
                                    : Text('Nao ha dados')
                              : CircularProgressIndicator();
                        }),


ListView(
                          children: _selecProducts.map((product) {
                            return ListTile(
                              key: ValueKey(product.id),
                              title: Text(product.type + " " + product.name),
                              leading:
                                  Text("#${_selecProducts.indexOf(product) + 1}"),
                            );
                          }).toList(),
                        ),





Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(snap.data[index]['donate']),
                  subtitle: Text(snap.data[index]['address']),
                ),
              ),
 */
