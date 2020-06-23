import 'package:flutter/material.dart';
import 'package:help_others/Clients/Controller/ClientController.dart';
import 'package:help_others/ReusableWidgets/DrawerDraw.dart';
import 'package:help_others/ReusableWidgets/GradientWidgets.dart';

import '../../main.dart';

final GlobalKey<ScaffoldState> _scaffoldKeyDoacao =
    new GlobalKey<ScaffoldState>();

class DoacaoEfetiva extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DoacaoEfetiva> {
  ClientController controllerAPI = new ClientController();
  List<Map> donates = new List<Map>();
  List<Map> listaperecivel = new List<Map>();
  List<Map> listaNaoperecivel = new List<Map>();

  List<Produto> _availableProducts = [];
  List<Produto> _selecProducts = [];

  Alert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Você tem certeza? bolo de coco'),
            actions: [
              MaterialButton(
                elevation: 5,
                child: Text('Sim, doar'),
                onPressed: () {
                  ///TODO rota de doar
                },
              )
            ],
          );
        });
  }

  Future<void> _getDonates() async {
    List<Map> donates = await controllerAPI.getDonates(token);
    listaperecivel = donates.where((element) => element['tipo'] == 'perecivel');
    listaNaoperecivel = donates.where((element) => element['tipo'] == 'perecivel');
  }

  @override
  void initState() {
    super.initState();
    _getDonates();
    _availableProducts = [
      Produto(id: 0, name: "Давно", type: "Почему", picture: "test"),
      Produto(id: 1, name: "это текст", type: "Cука", picture: "test"),
      Produto(id: 2, name: "сука блять", type: "Откуда", picture: "test"),
    ];
  }

  _selProd() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Seus Produtos Adicionados"),
          content: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                right: -40.0,
                top: -40.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.lightBlue,
                  ),
                ),
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter alertState) {
                  return Container(
                    width: 350.0,
                    height: 150.0,
                    child: ListView.builder(
                      itemCount: _availableProducts.length,
                      itemBuilder: (context, productIndex) {
                        return CheckboxListTile(
                          title: Text(_availableProducts[productIndex].type +
                              " " +
                              _availableProducts[productIndex].name),
                          value: _selecProducts
                              .contains(_availableProducts[productIndex]),
                          onChanged: (bool value) {
                            if (_selecProducts
                                .contains(_availableProducts[productIndex])) {
                              _selecProducts
                                  .remove(_availableProducts[productIndex]);
                            } else {
                              _selecProducts
                                  .add(_availableProducts[productIndex]);
                            }
                            setState(() {}); // update no parent state
                            alertState(() {});
                          },
                          secondary: const Icon(Icons.hourglass_empty),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    final _sendBtn = Padding(
      padding: EdgeInsets.only(top: 20, bottom: 15, left: 60, right: 60),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [Colors.blue, Colors.green],
          ).createShader(bounds);
        },
        child: RaisedButton(
          elevation: 5,
          shape: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
          color: Colors.white,
          onPressed: () {
            Alert(context).then((onValue) {});
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              Text(
                'Doar',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 8,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
    Widget _perecivel (List<Map> x){
      LinearGradientItens(
        child: Card(
          child: ListTile(
            leading: Icon(Icons.arrow_forward),
            title: Text("Escolher..."),
          //  onTap: _selProd(),
          ),
        ),
      );
      Align(alignment: Alignment.bottomCenter, child: _sendBtn);
    }


    Widget _naoperecivel(List<Map> x){
      LinearGradientItens(
        child: Card(
          child: ListTile(
            leading: Icon(Icons.arrow_forward),
            title: Text("Escolher..."),
          //  onTap: _selProd(),
          ),
        ),
      );
      Align(alignment: Alignment.bottomCenter, child: _sendBtn);
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKeyDoacao,
        drawer: DrawerDraw(),
        backgroundColor: Theme.of(context).backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: new AppBar(
          actions: [
            LinearGradientItens(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushNamed(context, '/DoacaoGeral');
                  },
                  color: Colors.blue,
                  iconSize: 35,
                )
              )
          ],
          centerTitle: true,
          title: LinearGradientItens(
              child: Text(
            'Meus Produtos',
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: new TabBar(
            labelColor: Colors.green,
            unselectedLabelColor: Colors.blue,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.dashboard),
                text: 'sxs',
              ),
              Tab(
                icon: Icon(Icons.check_circle_outline),
                text: 'xzxx',
              ),
            ],
          ),
        ),
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/teste.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
            ),
          ),
          child: new TabBarView(
            ///PageStorageKey
            children: [
               _perecivel(listaperecivel),
               _naoperecivel(listaNaoperecivel),
            ],
          ),
        ),
        /// se sobrar tempo animar essa kenga

      ),
    );
  }
}

class Produto {
  int id;
  String name;
  String type;
  String picture;

  Produto({this.id, this.name, this.type, this.picture});
}

/*
          floatingActionButton: FloatingActionButton(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceOut,
                  width: _tamanho,
                  height: _largura,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: Icon(Icons.add)),
            ),
          ),
         */
/*
bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            items: <Widget>[
              LinearGradientItens(child: Icon(Icons.add, size: 30)),
            ],
            color: Colors.transparent,
            buttonBackgroundColor: Colors.white12,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 500),
            onTap: (index) {},
          ),

 */
