
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final TextInputType? tipoTeclado;
  final IconData? icon;
  final int? maxCaracteres;

  Editor({this.maxCaracteres, this.controlador, this.rotulo, this.dica, this.tipoTeclado, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        textCapitalization: TextCapitalization.words,
        maxLength: maxCaracteres != null ? maxCaracteres : null,
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          labelText: rotulo,
          hintText: dica,
          icon: icon != null ? Icon(icon) : null,
        ),
        keyboardType: tipoTeclado,
      ),
    );
  }
}