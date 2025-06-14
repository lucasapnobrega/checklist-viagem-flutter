import 'package:flutter/material.dart';

class ChecklistScreen extends StatefulWidget {
  final String viagemNome;
  final Map<String, bool> itens;

  const ChecklistScreen({
    required this.viagemNome,
    required this.itens,
    Key? key,
  }) : super(key: key);

  @override
  _ChecklistScreenState createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  final TextEditingController novoItemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Checklist - ${widget.viagemNome}',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
        ),
        backgroundColor: Colors.teal,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(widget.itens);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: widget.itens.keys.map((item) {
                return CheckboxListTile(
                  title: Text(item),
                  value: widget.itens[item],
                  onChanged: (val) {
                    setState(() {
                      widget.itens[item] = val ?? false;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: novoItemController,
                    decoration: InputDecoration(hintText: 'Novo item'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    final novoItem = novoItemController.text.trim();
                    if (novoItem.isNotEmpty && !widget.itens.containsKey(novoItem)) {
                      setState(() {
                        widget.itens[novoItem] = false;
                        novoItemController.clear();
                      });
                    }
                  },
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(widget.itens);
            },
            child: Text('Concluir'),
          ),
        ],
      ),
    );
  }
}