
import 'package:flutter/material.dart';
import 'viagem_form_screen.dart';
import 'checklist_screen.dart';
import '../widgets/viagem_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> viagens = [];
  Map<String, Map<String, bool>> checklistPorViagem = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Minhas Viagens',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.teal,
        ),
      body: viagens.isEmpty
          ? Center(child: Text('Nenhuma viagem adicionada.'))
          : ListView.builder(
        itemCount: viagens.length,
        itemBuilder: (ctx, i) {
          final nome = viagens[i]['nome']!;
          final checklist = checklistPorViagem[nome] ?? {};
          final total = checklist.length;
          final concluidos = checklist.values.where((v) => v).length;
          final progresso = total == 0 ? 0.0 : concluidos / total;

          return ViagemTile(
            viagem: viagens[i],
            progresso: progresso,
            onTap: () async {
              final updatedChecklist = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ChecklistScreen(
                    viagemNome: nome,
                    itens: checklistPorViagem[nome] ?? {},
                  ),
                ),
              );
              if (updatedChecklist != null) {
                setState(() {
                  checklistPorViagem[nome] = Map<String, bool>.from(updatedChecklist);
                });
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novaViagem = await Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => ViagemFormScreen()),
          );
          if (novaViagem != null) {
            setState(() {
              viagens.add(novaViagem);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
