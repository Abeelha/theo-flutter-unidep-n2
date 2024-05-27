import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'constants.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final TextEditingController _appointmentController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _addAppointment() {
    if (_appointmentController.text.isNotEmpty && _selectedDate != null) {
      Provider.of<AppState>(context, listen: false).addAppointment(
        _appointmentController.text,
        _selectedDate!,
      );
      _appointmentController.clear();
      setState(() {
        _selectedDate = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento de Consultas', style: TextStyle(color: blackColor)),
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _appointmentController,
              decoration: InputDecoration(
                labelText: 'Descrição da Consulta',
                labelStyle: TextStyle(color: blackColor),
                filled: true,
                fillColor: backgroundColor,
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => _pickDate(context),
              child: Text(
                _selectedDate == null
                    ? 'Selecionar Data'
                    : 'Data: ${_selectedDate!.toLocal()}'.split(' ')[0],
                style: TextStyle(color: blackColor),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addAppointment,
              style: ElevatedButton.styleFrom(backgroundColor: secondaryColor),
              child: Text('Adicionar Consulta', style: TextStyle(color: blackColor)),
            ),
            Expanded(
              child: Consumer<AppState>(
                builder: (context, appState, child) {
                  return ListView.builder(
                    itemCount: appState.appointments.length,
                    itemBuilder: (context, index) {
                      final appointment = appState.appointments[index];
                      return ListTile(
                        title: Text(appointment['description'], style: TextStyle(color: blackColor)),
                        subtitle: Text(appointment['dateTime'].toString(), style: TextStyle(color: blackColor)),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: blackColor),
                          onPressed: () => appState.removeAppointment(index),
                        ),
                      );
                    },
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
