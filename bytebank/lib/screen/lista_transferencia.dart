import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screen/formulario_transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Transferências";

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencia = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_tituloAppBar)),
      body: ListView.builder(
        itemCount: widget._transferencia.length,
        itemBuilder: (context, index) {
          final transferencia = widget._transferencia[index];
          return ItemTransferencia(
            transferencia: transferencia,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          ).then((tranferenciaRecebida) {
            _atualiza(tranferenciaRecebida);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _atualiza(tranferenciaRecebida) {
    if (tranferenciaRecebida != null) {
      setState(() {
        widget._transferencia.add(tranferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia({super.key, required this.transferencia});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text('R\$ ${transferencia.valor.toString()}'),
        subtitle: Text(transferencia.numeroConta.toString()),
      ),
    );
  }
}
