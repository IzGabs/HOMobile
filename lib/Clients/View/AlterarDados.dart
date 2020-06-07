import 'package:flutter/material.dart';
import 'package:help_others/ReusableWidgets/CommonsWidgetsMethods.dart';
import 'package:help_others/ReusableWidgets/GradientWidgets.dart';

class AlterarDados extends StatefulWidget {
  @override
  _AlterarDadosState createState() => _AlterarDadosState();
}

class _AlterarDadosState extends State<AlterarDados> {
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
          /// TODO alterar dados
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(),
            Text(
              'Salvar',
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

  @override
  Widget build(BuildContext context) {
    final double scrHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
          'Alterar Dados',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(),
      body: ListView(
        children: [
          returnLogoApp(10.0, 5.0, 25, paddingTitle: 10),
          SizedBox(height: 50),

          /// TODO adicionar imagem do usuário [Bloco de imagem provisorio]
          /// TODO adicionar as valicoes
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            height: 100,
            width: double.infinity,
          ),

          ///
          textFormFieldFactory('Digite a senha atual', 'Senha Atual', scrHeight,
              Icons.vpn_key, true),
          textFormFieldFactory('Digite a nova senha', 'Nova Senha', scrHeight,
              Icons.vpn_key, true),
          textFormFieldFactory(
              'Email atual', 'Email atual', scrHeight, Icons.mail, false),
          textFormFieldFactory(
              'Email novo', 'Email novo', scrHeight, Icons.mail, false),
          _sendBtn
        ],
      ),
    );
  }
}
