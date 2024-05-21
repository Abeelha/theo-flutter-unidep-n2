import 'package:flutter/material.dart';
import 'constants.dart';

class PatientHistoryScreen extends StatefulWidget {
  @override
  _PatientHistoryScreenState createState() => _PatientHistoryScreenState();
}

class _PatientHistoryScreenState extends State<PatientHistoryScreen> {
  final List<String> _patientHistory = [
    'Consulta com João - 10/05/2023',
    'Consulta com Maria - 15/05/2023'
  ];
  final TextEditingController _historyController = TextEditingController();

  void _addHistory() {
    setState(() {
      _patientHistory.add(_historyController.text);
      _historyController.clear();
    });
  }

  void _removeHistory(int index) {
    setState(() {
      _patientHistory.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Pacientes'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _historyController,
              decoration: InputDecoration(
                labelText: 'Novo Histórico',
                filled: true,
                fillColor: backgroundColor,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addHistory,
              style: ElevatedButton.styleFrom(backgroundColor: secondaryColor),
              child: Text('Adicionar Histórico'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _patientHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_patientHistory[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeHistory(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
