import 'package:flutter/material.dart';
import 'package:help_others/ReusableWidgets/CommonsWidgetsMethods.dart';
import 'package:help_others/ReusableWidgets/DrawerDraw.dart';
import 'package:help_others/ReusableWidgets/GradientWidgets.dart';

class PerfilHome extends StatelessWidget {
  final token;
  const PerfilHome({Key key, this.token}) : super(key: key);

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
      drawer: DrawerDraw(),
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        actions: [
          LinearGradientItens(
              child: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/AlterDado');
            },
            color: Colors.blue,
            iconSize: 35,
          ))
        ],
        centerTitle: true,
        title: LinearGradientItens(
            child: Text(
          'Home',
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
          _generateContainer('Vem nota',
              'Professora ve o melhor front da vida e da 10 pros menino bom'),
          _generateContainer('Corda no pescoço',
              'Professora da nota pelo amor de deus, isso nao é meme'),
          _generateContainer(
              'Brasil ocupa ranking de sustentabilidade', 'O brasil é pika'),
          _generateContainer('Indices de fome caem no mundo', 'Muito bom'),
          // returnLogoApp(10.0, 6.0, 25, paddingTitle: 20),
        ],
      ),
    );
  }

//Aqui vai ser gerada as noticias de acordo com o que o cara receber
  Padding _generateContainer(tipo, noticia) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(10.0),
          title: Text(tipo),
          subtitle: Text(noticia),
          leading: Icon(
            Icons.new_releases,
            color: Colors.green,
          ),
        ),
      ),
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
