import 'package:flutter/material.dart';

import 'DrawerDraw.dart';
import 'GradientWidgets.dart';

Widget returnLogoApp(double marginTop, double imageScale, double fontSizeTitle,bool needTitle,
    {double paddingTitle}) {
  return Padding(
    padding: EdgeInsets.only(top: marginTop),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Image
        Image.asset(
          'images/planeta-verde.png',
          scale: imageScale,
        ),
        //

        !needTitle ?
            Offstage():
            Padding(
              padding:
                  EdgeInsets.only(top: paddingTitle ?? 50.0 ?? paddingTitle),
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
                      fontSize: fontSizeTitle,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Balsamiq'),
                ),
              ),
            ),
      ],
    ),
  );
}

///Esse método retorna um estilo textformField que pode ser usado em todo o app
///Assim sendo, vou deixar ele como um método factory que constrói esse Widget
///
///O campo validador é opcional, para usar ele quando estiver chamando o método, basta passar
///   [textFormFieldFactory( . . ., validator : função )]
/// A funcao aqui é a funçao validadora do textformField
///

///  Para adicionar um validador decente, só precisa passar pra ele assim
/// ```dart
///   textFormFieldFactory('Numero do Cartão', 'Num. Cartão', scrHeight,
///             Icons.credit_card, false,
///          borderRadius: 10, validator: (value) => value ?? 'O campo está nulo'),
/// ```
/// {@end-tool}
///
/// Na realidade, se voce quiser usar um validador que faça algo alem de verificar campos nulos,
///  só passar assim:
///   ```dart
/// (value){
///   if( TypeSomethingHere ){
///       return 'alguma coisa';
///       }
/// ```
/// {@end-tool}

Widget textFormFieldFactory(
    String desc, String tipo, double scrHeight, IconData icone, bool password,
    {Function validator, double borderRadius, IconData suffixIcon}) {
  return Container(
    padding: EdgeInsets.all(16),
    height: scrHeight * 0.10,
    color: Colors.transparent,
    child: Material(
      elevation: 5.0,
      shadowColor: Colors.black,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius ?? borderRadius ?? 25.0),
      child: TextFormField(
        validator: validator,
        obscureText: password,
        cursorColor: Colors.blue,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          //Se o Sufixo exitir, não existe prefixo
          suffixIcon: suffixIcon != null
              ? Icon(
                  suffixIcon,
                  size: 15.0,
                  color: Colors.blue[600],
                )
              : Offstage(),
          prefixIcon: suffixIcon == null
              ? Icon(
                  icone,
                  size: 15.0,
                  color: Colors.blue[600],
                )
              : Offstage(),
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
            borderSide: BorderSide(color: Colors.black, width: 0.1),
            borderRadius:
                BorderRadius.circular(borderRadius ?? borderRadius ?? 25.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.4),
            borderRadius:
                BorderRadius.circular(borderRadius ?? borderRadius ?? 25.0),
          ),
        ),
      ),
    ),
  );
}

AppBar appBarTransparente(String titulo) {
  return AppBar(
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
      '$titulo',
      style: TextStyle(color: Colors.white),
    )),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
