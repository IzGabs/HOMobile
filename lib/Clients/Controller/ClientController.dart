import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class ClientController {
  final userPath = pathAPI + 'users/';
  final donatePath = pathAPI + 'donate/';

  Future postRegUser(
      _user, _nome, _sobrenome, _email, _senha, _endereco) async {
    final retorno = await http.post(userPath + 'create/', body: {
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

  Future getDonates() async {
    final retorno = await http.get(donatePath);
    return json.decode(retorno.body);
  }
}
