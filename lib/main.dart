import 'package:flutter/material.dart';
import 'package:pokebank/screens/lista_transferencia.dart';

void main() => runApp(PokebankApp());

class PokebankApp extends StatelessWidget {
  const PokebankApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaTransferencias(),
      theme: ThemeData(
        primaryColor: Colors.red[900],
        accentColor: Colors.blue[700],
      ),
    );
  }
}





