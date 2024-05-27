// Este arquivo define a classe AppState, que gerencia o estado global do aplicativo
// incluindo agendamentos de consultas e perfis de médicos.

import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  final List<Map<String, dynamic>> _appointments = [];
  final List<Map<String, String>> _doctors = [
    {
      'name': 'Dr. João Silva',
      'specialization': 'Cardiologia',
      'contact': 'dr.joao@clinica.com',
    },
    {
      'name': 'Dra. Maria Souza',
      'specialization': 'Dermatologia',
      'contact': 'dra.maria@clinica.com',
    },
  ];

  // Getter para obter a lista de agendamentos
  List<Map<String, dynamic>> get appointments => _appointments;

  // Getter para obter a lista de médicos
  List<Map<String, String>> get doctors => _doctors;

  // Adiciona um novo agendamento à lista e notifica ouvintes
  void addAppointment(String description, DateTime dateTime) {
    _appointments.add({
      'description': description,
      'dateTime': dateTime,
    });
    notifyListeners();
  }

  // Remove um agendamento da lista pelo índice e notifica ouvintes
  void removeAppointment(int index) {
    _appointments.removeAt(index);
    notifyListeners();
  }

  // Adiciona um novo médico à lista e notifica ouvintes
  void addDoctor(String name, String specialization, String contact) {
    _doctors.add({
      'name': name,
      'specialization': specialization,
      'contact': contact,
    });
    notifyListeners();
  }

  // Remove um médico da lista pelo índice e notifica ouvintes
  void removeDoctor(int index) {
    _doctors.removeAt(index);
    notifyListeners();
  }
}
