
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViagemFormScreen extends StatefulWidget {
  @override
  _ViagemFormScreenState createState() => _ViagemFormScreenState();
}

class _ViagemFormScreenState extends State<ViagemFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final tipoController = TextEditingController();
  DateTime? _dataSelecionada;

  void _selecionarData() async {
    final data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (data != null) {
      setState(() {
        _dataSelecionada = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              'Nova Viagem',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
          ),
          backgroundColor: Colors.teal,
          iconTheme: IconThemeData(color: Colors.white)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome da Viagem'),
              ),
              TextFormField(
                controller: tipoController,
                decoration: InputDecoration(labelText: 'Tipo de Viagem'),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    _dataSelecionada == null
                        ? 'Nenhuma data escolhida'
                        : 'Data: ${DateFormat('dd/MM/yyyy').format(_dataSelecionada!)}',
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: _selecionarData,
                    child: Text('Selecionar Data'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _dataSelecionada != null) {
                    Navigator.of(context).pop({
                      'nome': nomeController.text,
                      'tipo': tipoController.text,
                      'data': DateFormat('yyyy-MM-dd').format(_dataSelecionada!),
                    });
                  }
                },
                child: Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
