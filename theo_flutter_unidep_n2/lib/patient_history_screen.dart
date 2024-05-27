// Este arquivo define a tela de histórico de pacientes, onde os usuários podem visualizar
// os agendamentos de consultas passados.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'constants.dart';

class PatientHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Pacientes', style: TextStyle(color: color1)),
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: color1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<AppState>(
          builder: (context, appState, child) {
            return ListView.builder(
              itemCount: appState.appointments.length,
              itemBuilder: (context, index) {
                final appointment = appState.appointments[index];
                return ListTile(
                  title: Text(appointment['description'], style: TextStyle(color: blackColor)),
                  subtitle: Text(appointment['dateTime'].toString(), style: TextStyle(color: blackColor)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
