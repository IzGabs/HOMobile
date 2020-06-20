import 'package:flutter/material.dart';
import 'package:help_others/ReusableWidgets/DrawerDraw.dart';
import 'package:help_others/ReusableWidgets/GradientWidgets.dart';

class Beneficios extends StatefulWidget {
  @override
  _BeneficiosState createState() => _BeneficiosState();
}

class _BeneficiosState extends State<Beneficios> {
  @override
  Widget build(BuildContext context) {

    List<String> itens = [
      'Benefício A',
      'Benefício B',
      'Benefício C',
      'Benefício D',
      'Benefício E',
      'Benefício A',
      'Benefício B',
      'Benefício C',
      'Benefício D',
      'Benefício E',

    ];

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
              'Benefícios',
              style: TextStyle(color: Colors.white),
            )
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ReorderableListView(
        children: [
          for(final item in itens)
            Card(
              color: Colors.white12,
              shadowColor: Colors.black12,
              key: ValueKey(item),
              elevation: 2,
              child: ListTile(
                title: Text(item),
                leading: Icon(Icons.accessible_forward),
              ),
            )
        ],
        onReorder: (oldIndex,newIndex){
          setState(() {
            if(newIndex>oldIndex){
              newIndex-=1;
            }
            final item = itens.removeAt(oldIndex);
            itens.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
