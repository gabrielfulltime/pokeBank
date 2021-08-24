import 'package:flutter/material.dart';
import 'package:pokebank/components/editor.dart';
import 'package:pokebank/models/transferencia.dart';

const _tituloAppBar = "Cadastro Novo Pokemon";
const _dicaPokeNome = "Bulbasaur";
const _dicaPokeNumero = "001";
const _rotuloPokeNome = "Nome do Pokemon";
const _rotuloPokeNumero = "Numero da pokedex";
const _botaoConfirmar = "Confirmar";

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoPokeNumero =
      TextEditingController();
  final TextEditingController _controladorCampoPokeNome =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoPokeNome,
                rotulo: _rotuloPokeNome,
                dica: _dicaPokeNome,
                tipoTeclado: TextInputType.name,
                maxCaracteres: 15,

            ),
            Editor(
                controlador: _controladorCampoPokeNumero,
                rotulo: _rotuloPokeNumero,
                dica: _dicaPokeNumero,
                tipoTeclado: TextInputType.number,
                icon: Icons.monetization_on,
              maxCaracteres: 3,
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_botaoConfirmar),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final String _pokeNome = _controladorCampoPokeNome.text;
    final String _pokeNumero = (_controladorCampoPokeNumero.text);

    // Validação
    final nomeVazio = _pokeNome.length == 0;
    final numeroVazio = _pokeNumero.length == 0;
    if (nomeVazio || numeroVazio) {
      return;
    }
    final _transferenciaCriada = Transferencia(_pokeNome, _pokeNumero);
    var conteudoTransferencia = _transferenciaCriada.toString();
    SnackBar(content: Text("$conteudoTransferencia"));
    Navigator.pop(context, _transferenciaCriada);
  }
}
