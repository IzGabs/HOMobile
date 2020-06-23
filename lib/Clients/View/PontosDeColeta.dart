import 'package:flutter/material.dart';
import 'package:help_others/ReusableWidgets/CommonsWidgetsMethods.dart';
import 'package:help_others/ReusableWidgets/DrawerDraw.dart';
import 'package:help_others/ReusableWidgets/GradientWidgets.dart';

class PontosDeColeta extends StatefulWidget {
  @override
  _PontosDeColetaState createState() => _PontosDeColetaState();
}

class _PontosDeColetaState extends State<PontosDeColeta> {
  TextEditingController _local = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double scrHeight = MediaQuery.of(context).size.height;

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
      body: ListView(
        children: [
          returnLogoApp(
            10.0,
            5.0,
            25,
            true,
            paddingTitle: 10,
          ),
          textFormFieldFactory(
            'Onde você está? ',
            'Pesquisar Locais proximos',
            scrHeight,
            Icons.search,
            false,
            _local,
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
              _generateContainer('Casa de Virgo (Shaka)', '6a Casa (de 12)'),
              _generateContainer(
                  'SunnyGO', 'Em algum lugar da GrandLine (Wano)'),
              _generateContainer('Sala do Hokage', 'Konohagakure'),
              _generateContainer(
                  'Vingadores', 'Sede Vingadores, sala Hulk Agiota'),
              _generateContainer(
                  'Satan House', 'Casa do Mr.Satan (Maior lutador vivo)'),
            ],
          ),
        ],
      ),
    );
  }

  Padding _generateContainer(tipo, localizacao) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(10.0),
          title: Text('Tipo: ' + tipo),
          subtitle: Text('Local: ' + localizacao),
          leading: Icon(Icons.place),
        ),
      ),
    );
  }
}
