import 'package:flutter/material.dart';
import 'package:help_others/ReusableWidgets/DrawerDraw.dart';
import 'package:help_others/ReusableWidgets/GradientWidgets.dart';
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
class DoacaoEfetiva extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DoacaoEfetiva> {
  List<Produto> _availableProducts = [];
  List<Produto> _selecProducts = [];

 Alert(BuildContext context){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text('Você tem certeza? bolo de coco'),
        actions: [
          MaterialButton(
            elevation: 5,
            child: Text('Sim, doar'),
            onPressed: (){
              ///TODO rota de doar
            },
          )
        ],
      );
    }
    );
  }

  @override
  void initState() {
    super.initState();
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
                          title:
                          Text(_availableProducts[productIndex].type + " " + _availableProducts[productIndex].name),
                          value: _selecProducts.contains(_availableProducts[productIndex]),
                          onChanged: (bool value) {
                            if (_selecProducts.contains(_availableProducts[productIndex])) {
                              _selecProducts.remove(_availableProducts[productIndex]);
                            } else {
                              _selecProducts.add(_availableProducts[productIndex]);
                            }
                            setState(() {});// update no parent state
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

  _onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    print('oldIndex:$oldIndex');
    print('newIndex:$newIndex');
    setState(() {
      Produto player = _selecProducts[newIndex];
      _selecProducts[newIndex] = _selecProducts[oldIndex];
      _selecProducts[oldIndex] = player;
    });
  }



  final List<Tab> _minhasTabs = <Tab> [
    new Tab(icon: new Icon(Icons.timelapse), text: "Perecível"),
    new Tab(
        icon: new Icon(Icons.restore),
        text: "Não-Perecível"),
  ];

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
            Alert(context).then((onValue){

            });
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

    return DefaultTabController(
      length: 2,
       child: Scaffold(
         key: _scaffoldKey,
         drawer: DrawerDraw(),
         backgroundColor: Theme.of(context).backgroundColor,
         resizeToAvoidBottomInset: false,
         appBar: new AppBar(
           actions: [
             LinearGradientItens(child: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){ Navigator.pushNamed(context, '/DoacaoGeral');}, color: Colors.blue, iconSize: 35,))
           ],

           centerTitle: true,
           title: LinearGradientItens(
               child: Text(
                 'Meus Produtos',
                 style: TextStyle(color: Colors.white),
               )
           ),
           backgroundColor: Colors.transparent,
           elevation: 0,
           bottom: new TabBar(
             labelColor: Colors.green,
             unselectedLabelColor: Colors.blue,
             tabs: _minhasTabs,
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
             children: _minhasTabs.map((Tab tab) {
               return Padding(
                 padding: const EdgeInsets.all(8.0),

                 ///TODO sendbtn tem q enviar dados. dar msg(pode ser snackbar) q enviou e retornar a tela main
                 child: Column(
                   children: <Widget>[
                     LinearGradientItens(
                       child: Card(
                         child: ListTile(
                           leading: Icon(Icons.arrow_forward),
                           title: Text("Escolher..."),
                           onTap: _selProd,
                         ),
                       ),
                     ),
                     Flexible(
                       child: ReorderableListView(
                         onReorder: _onReorder,
                         children: _selecProducts.map((product) {
                           return ListTile(
                             key: ValueKey(product.id),
                             title: Text(product.type + " " + product.name),
                             leading: Text("#${_selecProducts.indexOf(product) + 1}"),
                           );
                         }).toList(),
                       ),
                     ),
                     Align(alignment: Alignment.bottomCenter,child: _sendBtn),
                   ],
                 ),
               );
             }).toList(),
           ),
         ),
          /// se sobrar tempo animar essa kenga
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
