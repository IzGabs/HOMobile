import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class ClientController {
  Future postRegUser(
      _user, _nome, _sobrenome, _email, _senha, _endereco) async {
    final retorno = await http.post(pathAPI + 'users/create/', body: {
      'username': _user,
      'email': _email,
      'password': _senha,
      // 'sobrenome': _sobrenome,
      // 'email': _email,
      // 'senha': _senha,
      // 'endereco': _endereco,
    });
    return retorno;
  }
}
