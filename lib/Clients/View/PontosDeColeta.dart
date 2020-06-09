import 'package:flutter/material.dart';
import 'package:help_others/ReusableWidgets/CommonsWidgetsMethods.dart';

class PontosDeColeta extends StatefulWidget {
  @override
  _PontosDeColetaState createState() => _PontosDeColetaState();
}

class _PontosDeColetaState extends State<PontosDeColeta> {
  @override
  Widget build(BuildContext context) {
    final double scrHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBarTransparente('Pontos de coleta'),
      body: ListView(
        children: [
          returnLogoApp(10.0, 5.0, 25, paddingTitle: 10),
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
