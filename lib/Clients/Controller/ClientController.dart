import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class ClientController {
  final userPath = pathAPI + 'users/';
  final donatePath = pathAPI + 'donate/';
  final loginPath = pathAPI + 'api/token/';

  Future login(String _username, String _password) async {
    final retorno = await http
        .post(loginPath, body: {'username': _username, 'password': _password});
    return json.decode(retorno.body);
  }

  Future postRegUser(
      _user, _nome, _sobrenome, _email, _senha, _endereco, token) async {
    final retorno = await http.post(
      userPath + 'create/',
      body: {
        'username': _user,
        'email': _email,
        'password': _senha,
        'first_name': _nome,
        'last_name': _sobrenome,
        // 'email': _email,
        // 'senha': _senha,
        // 'endereco': _endereco,
      },
    );
    return json.decode(retorno.body);
  }
  Future reservarDoacao(String url, String token) async{
    final retorno = await http.delete(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );
    return json.decode(retorno.body);
  }

  Future postDonates(_nome, _tipo, token) async {
    final retorno = await http.post(
      donatePath,
      body: {'item': _nome, 'tipo': _tipo},
      headers: {'Authorization': 'Bearer $token'},
    );
    return json.decode(retorno.body);
  }

  Future getDonates(String token) async {
    final retorno = await http.get(
      donatePath,
      headers: {'Authorization': 'Bearer $token'},
    );
    return json.decode(retorno.body);
  }
}
