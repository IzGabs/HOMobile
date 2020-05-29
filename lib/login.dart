import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double scrHeight = MediaQuery.of(context).size.height;

//Botão de Enviar
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
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              Text(
                'Entrar',
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

    final _regBtn = Padding(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        children: [
          ShaderMask(
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
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(),
                  Text(
                    'Cadastre-se',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 5,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 15,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  //TODO esqueci a senha
                },
                child: Text('Esqueci a senha',
                    style: TextStyle(color: Colors.blue, fontSize: 12)),
              ),
            ),
          )
        ],
      ),
    );

//Conteúdo da tela ( Email, senha e botão)
    final _content = Padding(
        padding: EdgeInsets.symmetric(vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _textFormFieldFactory(
                'Digite o seu email', 'Email', scrHeight, Icons.email, false),
            _textFormFieldFactory(
                'Digite a sua senha', 'Senha', scrHeight, Icons.lock, true),
            _sendBtn,
            _regBtn
          ],
        ));

    final topContent = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Image
          Image.asset(
            'images/planeta-verde.png',
            scale: 3,
          ),

          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.blue, Colors.green],
                ).createShader(bounds);
              },
              child: Text(
                'Help Others',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Balsamiq'),
              ),
            ),
          ),
        ],
      ),
    );

    // ------ Scaffold
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        body: ListView(
          children: <Widget>[
            //'HelpOthers' Text
            topContent,
            //Conteúdo
            _content,
          ],
        ),
      ),
    );
  }

  Widget _textFormFieldFactory(String desc, String tipo, double scrHeight,
      IconData icone, bool password) {
    return Container(
      padding: EdgeInsets.all(16),
      height: scrHeight * 0.10,
      color: Colors.transparent,
      child: Material(
        elevation: 5.0,
        shadowColor: Colors.black,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25.0),
        child: TextFormField(
          obscureText: password,
          cursorColor: Colors.blue,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icone,
              size: 15.0,
              color: Colors.blue[600],
            ),
            labelText: '$tipo',
            labelStyle: TextStyle(
                letterSpacing: 3,
                backgroundColor: Colors.transparent,
                color: Colors.black54),
            contentPadding:
                new EdgeInsets.symmetric(vertical: 1.0, horizontal: 20.0),
            alignLabelWithHint: true,
            hintText: '$desc',
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.4),
              borderRadius: BorderRadius.circular(25.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1.4),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}

// floatingActionButton: ShaderMask(
//           shaderCallback: (Rect bounds) {
//             return LinearGradient(
//               colors: [Colors.blue[900], Colors.green],
//             ).createShader(bounds);
//           },
//           child: FloatingActionButton.extended(
//               backgroundColor: Colors.white,
//               onPressed: () {
//                 //Cadastrar
//               },
//               label: Text('Cadastrar'),
//               icon: Icon(Icons.add)),
//         ),
