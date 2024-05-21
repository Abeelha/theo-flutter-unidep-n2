import 'package:flutter/material.dart';
import 'constants.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final List<String> _appointments = [
    'Consulta com Dr. João - 10:00 AM',
    'Consulta com Dra. Maria - 11:00 AM'
  ];
  final TextEditingController _appointmentController = TextEditingController();

  void _addAppointment() {
    setState(() {
      _appointments.add(_appointmentController.text);
      _appointmentController.clear();
    });
  }

  void _removeAppointment(int index) {
    setState(() {
      _appointments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento de Consultas'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _appointmentController,
              decoration: InputDecoration(
                labelText: 'Novo Agendamento',
                filled: true,
                fillColor: backgroundColor,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addAppointment,
              style: ElevatedButton.styleFrom(backgroundColor: secondaryColor),
              child: Text('Adicionar Agendamento'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _appointments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_appointments[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeAppointment(index),
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
