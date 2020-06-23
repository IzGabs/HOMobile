import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'Clients/Controller/ClientController.dart';
import 'ReusableWidgets/CommonsWidgetsMethods.dart';
import 'main.dart';

class Login extends StatelessWidget {
  TextEditingController _usuario = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  ClientController controllerAPI = new ClientController();

  GlobalKey<ScaffoldState> _scafoldLoginKey = new GlobalKey();

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
          onPressed: () async {
            Map loginResponse = await controllerAPI.login(
                _usuario.text, _password.text.toString());

            if (loginResponse['detail'] == null) {
              token = loginResponse['access'];
              Navigator.popAndPushNamed(context, '/ClientHomePage');
            } else {
              _scafoldLoginKey.currentState.showSnackBar(
                  SnackBar(content: Text(loginResponse['detail'])));
            }
          },
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
              onPressed: () {
                Navigator.pushNamed(context, '/HomeCadastro');
              },
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
            textFormFieldFactory('Digite o seu user', 'User', scrHeight,
                Icons.email, false, _usuario),
            textFormFieldFactory('Digite a sua senha', 'Senha', scrHeight,
                Icons.lock, true, _password),
            _sendBtn,
            _regBtn
          ],
        ));

    // ignore: deprecated_member_use
    final tween = MultiTrackTween([
      Track("color1").add(Duration(seconds: 5),
          ColorTween(begin: Colors.black, end: Colors.blue)),
      Track("color2").add(Duration(seconds: 5),
          ColorTween(begin: Colors.green, end: Colors.black))
    ]);

    return SafeArea(
      child: Scaffold(
        key: _scafoldLoginKey,
        backgroundColor: Theme.of(context).backgroundColor,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Container(
          // ignore: deprecated_member_use
          child: ControlledAnimation(
            playback: Playback.MIRROR,
            tween: tween,
            duration: tween.duration,
            builder: (context, animation) {
              return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [animation["color2"], animation["color1"]])),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListView(
                    children: <Widget>[
                      returnLogoApp(10.0, 3.0, 50, true),
                      //Conteúdo
                      _content,
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/*

    // ------ Scaffold
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: ListView(
          children: <Widget>[
            //'HelpOthers' Text
            returnLogoApp(10.0, 3.0, 50, needTitle: true),
            //Conteúdo
            _content,
          ],
        ),
      ),
    );
  }
}
*/
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
