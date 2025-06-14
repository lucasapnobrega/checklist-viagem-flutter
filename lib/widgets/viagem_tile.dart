
import 'package:flutter/material.dart';

class ViagemTile extends StatelessWidget {
  final Map<String, String> viagem;
  final VoidCallback onTap;
  final double progresso;

  const ViagemTile({
    required this.viagem,
    required this.onTap,
    required this.progresso,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cor = progresso == 1.0
        ? Colors.green
        : (progresso > 0.5 ? Colors.orange : Colors.red);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(viagem['nome'] ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Data: ${viagem['data'] ?? ''} • Tipo: ${viagem['tipo'] ?? ''}'),
            SizedBox(height: 4),
            LinearProgressIndicator(
              value: progresso,
              backgroundColor: Colors.grey.shade300,
              color: cor,
            )
          ],
        ),
        onTap: onTap,
        trailing: Icon(Icons.checklist),
      ),
    );
  }
}
