import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:help_others/ReusableWidgets/DrawerDraw.dart';
import 'package:help_others/ReusableWidgets/GradientWidgets.dart';

class DoacaoGeral extends StatefulWidget {
  DoacaoGeral({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ToDoListState createState() => ToDoListState();
}

class ToDoListState extends State<DoacaoGeral> {
  List<TaskModel> taskList = [
    TaskModel(id: '1', title: 'Item 1', status: 'Não-Perecível/Outros', name: 'Camisa'),
    TaskModel(id: '2', title: 'Item 2', status: 'Não-Perecível/Outros', name: 'Jeans'),
    TaskModel(id: '3', title: 'Item 3', status: 'Perecível', name: 'Lanchinho da Madrugada')
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDraw(),
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        actions: [
          LinearGradientItens(child: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){ Navigator.pushNamed(context, '/ClientHomePage');}, color: Colors.blue, iconSize: 35,))
        ],
        centerTitle: true,
        title: LinearGradientItens(
            child: Text(
              'Listagem de Produtos',
              style: TextStyle(color: Colors.white),
            )
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: buildBody(),
      floatingActionButton: SpeedDial(
        curve: Curves.bounceOut,
          backgroundColor: Colors.blue,
          animatedIcon: AnimatedIcons.menu_close,
          overlayColor: Colors.black,
          children: [
            SpeedDialChild(
               ///Todo ROUTE PRA DOAÇÃO EFETIVA
              child: Icon(Icons.monetization_on),
              labelBackgroundColor: Colors.black87,
              label: 'Doação Monetária',
              labelStyle: TextStyle(fontSize: 18.0),
              backgroundColor: Colors.green,
              foregroundColor: Colors.black,
            ),
            SpeedDialChild(
              ///Todo ROUTE PRA DOAÇÃO MONETARIA
              child: Icon(Icons.check),
              labelBackgroundColor: Colors.black87,
              label: "Doação Padrão",
              labelStyle: TextStyle(fontSize: 18.0),
              backgroundColor: Colors.green,
              foregroundColor: Colors.black,
            ),
          ],
        ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white12,
        child: Container(height: 50.0,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final TaskModel item = taskList.removeAt(oldIndex);
      taskList.insert(newIndex, item);
    });
  }

  Widget ownerNameWidget(TaskModel todo) {
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
                '${todo.name}',
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

  Widget statusWidget(TaskModel todo) {
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
                '${todo.status}',
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

  Widget toDo(TaskModel todo) {
    return Container(
        key: Key(todo.id),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            //color: const Color(0xFF66BB6A),
            boxShadow: [
              BoxShadow(
                color: Colors.white12,
                blurRadius: 5.0,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(
                10.0,
              ),
              child: Text(
                todo.title,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ownerNameWidget(todo),
                  statusWidget(todo),
                ],
              ),
            )
          ],
        )
    );
  }

  Widget buildBody() {
    return ReorderableListView(
      children: taskList.map((todo) {
        return toDo(todo);
      }).toList(),

      onReorder: _onReorder,
    );
  }
}

class TaskModel {
  String id;
  String title;
  String status;
  String name;

  TaskModel(
      {@required this.id,
        @required this.title,
        @required this.status,
        @required this.name});
}