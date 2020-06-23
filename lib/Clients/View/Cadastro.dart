import 'package:flutter/material.dart';
import 'package:help_others/Clients/Controller/ClientController.dart';
import 'package:help_others/main.dart';
import '../../ReusableWidgets/GradientWidgets.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool _validate = false;
String variavel;
bool emailtest = false;

class Cadastro extends StatefulWidget {
  const Cadastro({Key key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _user = new TextEditingController();
  TextEditingController _nome = new TextEditingController();
  TextEditingController _sobrenome = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _senha = new TextEditingController();
  TextEditingController _endereco = new TextEditingController();

  bool _agreedToTOS = true;

  @override
  Widget build(BuildContext context) {
    final double scrHeight = MediaQuery.of(context).size.height;

    final _content = new Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _textFormFieldFactory(
                'Usuário', Icons.person, false, emailtest, variavel, _user),
            _textFormFieldFactory(
                'Nome', Icons.person, false, emailtest, variavel, _nome),
            _textFormFieldFactory('Sobrenome', Icons.person_add, false,
                emailtest, variavel, _sobrenome),
            _textFormFieldFactory(
                'E-mail', Icons.email, false, true, variavel, _email),
            _textFormFieldFactory(
                'Senha', Icons.lock_outline, true, emailtest, variavel, _senha),
            _textFormFieldFactory('Endereço', Icons.location_on, false,
                emailtest, variavel, _endereco),
          ],
        ));

    return Form(
      key: _formKey,
      autovalidate: _validate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //
          _content,
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: _agreedToTOS,
                  onChanged: _setAgreedToTOS,
                ),
                GestureDetector(
                  onTap: () => _setAgreedToTOS(!_agreedToTOS),
                  child: const Text(
                    'Eu concordo com os Termos de serviço',
                  ),
                ),
              ],
            ),
          ),
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              children: [
                LinearGradientItens(
                  child: RaisedButton(
                    elevation: 5,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.white,
                    onPressed: _submittable() ? _sendForm : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Spacer(),
                        Text(
                          'Concluir',
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _submittable() {
    return _agreedToTOS;
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }

  _sendForm() async {
    if (_formKey.currentState.validate()) {
      // Sem erros na validação
      _formKey.currentState.save();
      _validate = true;

      Map x = await ClientController().postRegUser(_user.text, _nome.text,
          _sobrenome.text, _email.text, _senha.text, _endereco.text, token);
      x['detail'] != null
          ? Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(x['detail'])),
            )
          : Navigator.pushNamed(context, '/Login');
    } else {
      // erro de validação
      setState(() {
        _validate = false;
      });
    }
  }
}

Widget _textFormFieldFactory(String tipo, IconData icone, bool password,
    bool emailtest, variavel, TextEditingController controller) {
  return new Container(
    padding: EdgeInsets.all(16),
    color: Colors.transparent,
    child: Material(
      elevation: 5.0,
      shadowColor: Colors.black,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(15.0),
      child: TextFormField(
        obscureText: password,
        controller: controller,
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
              new EdgeInsets.symmetric(vertical: 1.0, horizontal: 15.0),
          alignLabelWithHint: true,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.4),
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.4),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        validator: (String value) {
          String pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regExp = new RegExp(pattern);
          if (value.isEmpty) {
            return '$tipo obrigatório';
          } else if (emailtest == true && !regExp.hasMatch(value)) {
            return 'E-mail inválido';
          }
          return null;
        },
        onSaved: (String value) {
          variavel = value;
        },
      ),
    ),
  );
}
