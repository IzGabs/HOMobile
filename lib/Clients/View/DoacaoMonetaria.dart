import 'package:flutter/material.dart';
import 'package:help_others/ReusableWidgets/CommonsWidgetsMethods.dart';

class DoacaoMonetaria extends StatefulWidget {
  @override
  _DoacaoMonetariaState createState() => _DoacaoMonetariaState();
}

class _DoacaoMonetariaState extends State<DoacaoMonetaria> {
  TextEditingController _numCartao = new TextEditingController();
  TextEditingController _nome = new TextEditingController();
  TextEditingController _cvv = new TextEditingController();
  TextEditingController _validade = new TextEditingController();
  TextEditingController _valor = new TextEditingController();
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
          /// TODO Realizar transação monetária
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

  /// Sõ usar um validador descente seu merda

  @override
  Widget build(BuildContext context) {
    final double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBarTransparente('Doação monetária'),
      body: Form(
        child: ListView(
          children: [
            returnLogoApp(10.0, 5.0, 25, true, paddingTitle: 10),
            SizedBox(height: 30),
            textFormFieldFactory('Numero do Cartão', 'Num. Cartão', scrHeight,
                Icons.credit_card, false, _numCartao,
                borderRadius: 10),
            textFormFieldFactory('Nome (Como escrito no cartão)', 'Nome',
                scrHeight, Icons.person, false, _nome,
                borderRadius: 10),
            textFormFieldFactory('Cvv (3 numeros atrás do cartão)', 'CVV',
                scrHeight, Icons.chrome_reader_mode, false, _cvv,
                borderRadius: 10),
            textFormFieldFactory(
                'Validade do cartão',
                'Data de Validade do cartão',
                scrHeight,
                Icons.date_range,
                false,_validade,
                borderRadius: 10),
            textFormFieldFactory('Valor da Doação', 'Valor a ser doado',
                scrHeight, Icons.attach_money, false, _valor,
                borderRadius: 10),
            _sendBtn
          ],
        ),
      ),
    );
  }
}
