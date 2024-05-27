// Este arquivo define a tela principal do aplicativo, onde os usuários podem navegar
// para as telas de agendamento, histórico de pacientes e perfil do médico.

import 'package:flutter/material.dart';
import 'appointment_screen.dart';
import 'patient_history_screen.dart';
import 'doctor_profile_screen.dart';
import 'constants.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clínica Médica', style: TextStyle(color: color1)),
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(
              title: 'Agendamento de Consultas',
              color: tertiaryColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            MenuButton(
              title: 'Histórico de Pacientes',
              color: quaternaryColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientHistoryScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            MenuButton(
              title: 'Perfil do Médico',
              color: secondaryColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DoctorProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Widget personalizado para criar botões de menu na tela principal
class MenuButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;

  MenuButton({required this.title, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(double.infinity, 60),
      ),
      child: Text(title, style: TextStyle(fontSize: 18, color: blackColor)),
    );
  }
}
