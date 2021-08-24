import 'package:flutter/material.dart';
import 'package:pokebank/models/transferencia.dart';
import 'formulario_transferencia.dart';

const _tituloAppBar = "Pokemons Capiturados";

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia?> transferencias = [];
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget.transferencias.length,
        itemBuilder: (context, indice) {
          final Transferencia? transferencia = widget.transferencias[indice];
          debugPrint("Tamanho da lista ${widget.transferencias.length}");
          return ItemTransferencia(transferencia!);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          // Apos retornar da outra pagina, executa o then que é como um callBack
          future.then((transferenciaRecebida) => _atualizaLista(transferenciaRecebida));
        },
      ),
    );
  }

  void _atualizaLista(Transferencia? transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget.transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.pokeNome),
        subtitle: Text(_transferencia.pokeNumero.toString()),
      ),
    );
  }
}
