import 'package:flutter/material.dart';
import 'package:help_others/ReusableWidgets/CommonsWidgetsMethods.dart';
import 'package:help_others/ReusableWidgets/DrawerDraw.dart';
import 'package:help_others/ReusableWidgets/GradientWidgets.dart';

class PontosDeColeta extends StatefulWidget {
  @override
  _PontosDeColetaState createState() => _PontosDeColetaState();
}

class _PontosDeColetaState extends State<PontosDeColeta> {
  @override
  Widget build(BuildContext context) {
    final double scrHeight = MediaQuery.of(context).size.height;

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
      body: ListView(
        children: [
          returnLogoApp(10.0, 5.0, 25,true  ,paddingTitle: 10, ),
          textFormFieldFactory(
            'Onde você está? ',
            'Pesquisar Locais proximos',
            scrHeight,
            Icons.search,
            false,
            suffixIcon: Icons.search,
          ),
          //
          Center(
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.blue, Colors.green],
                ).createShader(bounds);
              },
              child: Text(
                'Pontos de Coleta',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Balsamiq'),
              ),
            ),
          ),
          // ListView.builder(itemBuilder: )
          Column(
            children: [
              _generateContainer(Colors.grey),
              _generateContainer(Colors.grey),
              _generateContainer(Colors.grey),
              _generateContainer(Colors.grey),
              _generateContainer(Colors.grey),
              _generateContainer(Colors.grey),
              _generateContainer(Colors.grey),
              _generateContainer(Colors.grey),
              _generateContainer(Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Container _generateContainer(color) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      height: 100,
      width: double.infinity,
    );
  }
}
