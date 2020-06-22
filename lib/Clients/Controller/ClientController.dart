import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class ClientController {
  final userPath = pathAPI + 'users/';
  final donatePath = pathAPI + 'donate/';
  final loginPath = pathAPI + 'api/token/';

  Future login(String _username,String _password) async{
    final retorno = await http.post(loginPath, body: {
      'username': _username,
      'password': _password
    });
    return retorno.body;
  }

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



  Future postDonates(_nome, _tipo) async{
    final retorno = await http.post(userPath + 'create/', body: {
      'nome': _nome,
      'tipo': _tipo
    });
    return retorno;
  }




  Future getDonates() async {
    final retorno = await http.get(donatePath, headers: {'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTkzMzQzODc0LCJqdGkiOiI0ODVkNjI0OTI4MjU0Yzg1ODNmMDg5ZjNjY2UxZWFkNSIsInVzZXJfaWQiOjl9.hh6_V1jzpOffqIMxgllBFsod2tOucTQXl5oHwGlCpOE'},);
    return json.decode(retorno.body);
  }
}
