import 'package:flutter/material.dart';

import 'GradientWidgets.dart';

const String _AccountName = 'Aravind Vemula';
const String _AccountEmail = 'vemula.aravind336@gmail.com';
const String _AccountAbbr = 'AV';

class DrawerDraw extends Drawer{

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 15,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.contacts,
            text: 'Gerenciar Doação',
            onTap: () =>
            ///TODO CRIAR REDIRECIONAMENTO PARA GERENCIAR DOAÇÃO
                Navigator.pushNamed(context, '/ClientHomePage'),
          ),
          _createDrawerItem(
            icon: Icons.event,
            text: 'Analisar Perfil',
            onTap: () =>
            ///TODO CRIAR REDIRECIONAMENTO PARA ANALISAR PERFIL
                Navigator.pushNamed(context, '/ClientHomePage'),
          ),
          _createDrawerItem(
            icon: Icons.note,
            text: 'Verificar Benefício',
            onTap: () =>
            ///TODO CRIAR REDIRECIONAMENTO PARA VERIFICAR BENEFÍCIO
                Navigator.pushNamed(context, '/ClientHomePage'),
          ),
          LinearGradientItens(
           child: Divider(
              thickness: 2,
              color: Colors.green,
            ),
          ),
          _createDrawerItem(
            icon: Icons.event,
            text: 'Pontos de Coleta',
            onTap: () =>
            ///TODO CRIAR REDIRECIONAMENTO PARA PONTOS DE COLETA
                Navigator.pushNamed(context, '/ClientHomePage'),
          ),
          _createDrawerItem(
            icon: Icons.event,
            text: 'Historico',
            onTap: () =>
            ///TODO CRIAR REDIRECIONAMENTO PARA HISTORICO
                Navigator.pushNamed(context, '/ClientHomePage'),
          ),
          _createDrawerItem(
            icon: Icons.event,
            text: 'Verificar Doador',
            onTap: () =>
            ///TODO CRIAR REDIRECIONAMENTO PARA VERIFICAR DOADOR
                Navigator.pushNamed(context, '/ClientHomePage'),
          ),
          _createDrawerItem(
            icon: Icons.event,
            text: 'Verificar Receptor',
            onTap: () =>
            ///TODO CRIAR REDIRECIONAMENTO PARA VERIFICAR RECEPTOR
                Navigator.pushNamed(context, '/ClientHomePage'),
          ),
          LinearGradientItens(
            child: Divider(
              thickness: 2,
              color: Colors.green,
            ),
          ),
          _createDrawerItem(
            icon: Icons.event,
            text: 'Verificar Ranking',
            onTap: () =>
            ///TODO CRIAR REDIRECIONAMENTO PARA RANKING
                Navigator.pushNamed(context, '/ClientHomePage'),
          ),
          _createDrawerItem(
            icon: Icons.event,
            text: 'Mais Novidades',
            onTap: () =>
            ///TODO CRIAR REDIRECIONAMENTO PARA MAIS NOVIDADES
                Navigator.pushNamed(context, '/ClientHomePage'),
          ),
          _createDrawerItem(
            icon: Icons.event,
            text: 'Descrição',
            onTap: () =>
            ///TODO CRIAR REDIRECIONAMENTO PARA DESCRIÇÃO
                Navigator.pushNamed(context, '/ClientHomePage'),
          ),
          _createDrawerItem(icon: Icons.bug_report, text: 'Reportar Bugs'),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Stack(children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: const Text(_AccountName),
              accountEmail: const Text(_AccountEmail),
              currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.brown,
                  child: new Text(_AccountAbbr)
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  //onTap: () => _onTapOtherAccounts(context),
                  child: new Semantics(
                    label: 'Muda Conta',
                    child: new CircleAvatar(
                      backgroundColor: Colors.brown,
                      child: new Text('CU'),
                    ),
                  ),
                ),
              ],
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/523213.jpg'))),
          ),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement elevation
  double get elevation => throw UnimplementedError();

  @override
  // TODO: implement semanticLabel
  String get semanticLabel => throw UnimplementedError();
}
