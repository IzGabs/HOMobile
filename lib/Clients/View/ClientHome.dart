import 'package:flutter/material.dart';
import 'package:help_others/ReusableWidgets/DrawerDraw.dart';
import 'package:help_others/ReusableWidgets/GradientWidgets.dart';
import 'dart:ui' show ImageFilter;

class PerfilHome extends StatelessWidget {
  const PerfilHome({Key key}) : super(key: key);

  /// TODO colocar os campos obrigatórios que ele precisa passa pra acessar essa tela

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    final _imageInfo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'images/medical-mask.png',
          fit: BoxFit.fill,
          scale: 5,
        ),
        SizedBox(
          width: 20,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: widthScreen / 2),
          child: RichText(
            text: TextSpan(
                text: 'Ola User! Você pode ver todas as ',
                style: TextStyle(
                    color: Theme.of(context).textSelectionColor, fontSize: 15),
                children: <TextSpan>[
                  _buildTextSpanChildren(
                      'Funcionalidades ', Colors.green, FontWeight.w800,
                      fonte: FontStyle.italic),
                  _buildTextSpanChildren('do aplicativo através do ',
                      Theme.of(context).textSelectionColor, FontWeight.w400),
                  _buildTextSpanChildren('botão do menu ali em cima. ',
                      Colors.green, FontWeight.w800,
                      fonte: FontStyle.italic),
                ]),
          ),
        ),
      ],
    );

    final _imageUser = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(40.0),
          child: Image.asset(
            'images/woman.png',
            alignment: Alignment.centerLeft,
            fit: BoxFit.fill,
            scale: 5,
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: widthScreen / 1.5),
          child: Text(
            'EcoNews',
            style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontSize: 25,
                fontWeight: FontWeight.w800,
                fontFamily: 'Balsamiq'),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
        drawer: Theme(
            data: Theme.of(context).copyWith(
              // Set the transparency here
              canvasColor: Theme.of(context).backgroundColor, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
            ),
            child: DrawerDraw(),
        ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.green,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        centerTitle: true,
        title: LinearGradientItens(
            child: Text(
          'HelpOthers HomePage',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(height: 50),
          ////
          _imageInfo,
          //
          _imageUser,
          SizedBox(height: 50),
          //
          _generateContainer(Colors.green),
          _generateContainer(Colors.yellow),
          _generateContainer(Colors.blue),
          _generateContainer(Colors.red)
          // returnLogoApp(10.0, 6.0, 25, paddingTitle: 20),
        ],
      ),
    );
  }

//Aqui vai ser gerada as noticias de acordo com o que o cara receber
  Container _generateContainer(color) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      height: 100,
      width: double.infinity,
    );
  }

  TextSpan _buildTextSpanChildren(texto, cor, fontWeight, {fonte}) {
    return TextSpan(
      text: texto,
      style: TextStyle(
        color: cor,
        fontSize: 15,
        fontWeight: fontWeight,
        fontStyle: fonte,
      ),
    );
  }
}
