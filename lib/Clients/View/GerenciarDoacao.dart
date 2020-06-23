import 'package:flutter/material.dart';
import 'package:help_others/Clients/Controller/ClientController.dart';
import 'package:help_others/ReusableWidgets/CommonsWidgetsMethods.dart';
import 'package:help_others/ReusableWidgets/DrawerDraw.dart';

import '../../main.dart';

class GerenciarDoacao extends StatefulWidget {
  @override
  _GerenciarDoacaoState createState() => _GerenciarDoacaoState();
}

class _GerenciarDoacaoState extends State<GerenciarDoacao> {
  TextEditingController _nomeItem = new TextEditingController();
  TextEditingController _qtdeItem = new TextEditingController();
  TextEditingController _validadeItem = new TextEditingController();
  TextEditingController _validade = new TextEditingController();
  TextEditingController _valor = new TextEditingController();
  String dropDownValue;

  ClientController controllerAPI = new ClientController();

  /// Sõ usar um validador descente seu merda

  @override
  Widget build(BuildContext context) {
    final double scrHeight = MediaQuery.of(context).size.height;

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
            Map retorno = await controllerAPI.postDonates(
                _nomeItem.text, dropDownValue, token);
            if (retorno['url'] != null) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Sucesso!!')));
            } else {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Deu ruim!!')));
            }
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

    return Scaffold(
      drawer: DrawerDraw(),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBarTransparente('Doação Item'),
      body: Form(
        child: ListView(
          children: [
            returnLogoApp(10.0, 5.0, 25, true, paddingTitle: 10),
            SizedBox(height: 30),
            textFormFieldFactory('Nome Item', 'Nome', scrHeight,
                Icons.next_week, false, _nomeItem,
                borderRadius: 10),
            textFormFieldFactory('Quantidade', 'Quantidade', scrHeight,
                Icons.format_list_numbered_rtl, false, _qtdeItem,
                borderRadius: 10),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 5,
                shadowColor: Colors.black,
                shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: DropdownButtonFormField<String>(
                    validator: (value) =>
                        value == '' || value == null ? 'Selecione o s' : null,
                    decoration: InputDecoration.collapsed(
                      hintText: '',
                    ),
                    icon: Icon(Icons.keyboard_arrow_down),
                    isExpanded: false,
                    hint: Text('Selecione o tipo'),
                    items: <String>['Perecível', 'Não perecível']
                        .map((String value) => new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            ))
                        .toList(),
                    value: dropDownValue,
                    onTap: () {},
                    onChanged: (String value) {
                      dropDownValue = value;
                    },
                  ),
                ),
              ),
            ),
            _sendBtn
          ],
        ),
      ),
    );
  }
}
