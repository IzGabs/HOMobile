import 'package:flutter/material.dart';
import 'Clients/View/Cadastro.dart';

class HomeCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Cadastro'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
          child: Cadastro(),
        ),
      ),
    );
  }
}