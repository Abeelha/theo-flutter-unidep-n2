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

  List<Map<String, dynamic>> get appointments => _appointments;
  List<Map<String, String>> get doctors => _doctors;

  void addAppointment(String description, DateTime dateTime) {
    _appointments.add({
      'description': description,
      'dateTime': dateTime,
    });
    notifyListeners();
  }

  void removeAppointment(int index) {
    _appointments.removeAt(index);
    notifyListeners();
  }

  void addDoctor(String name, String specialization, String contact) {
    _doctors.add({
      'name': name,
      'specialization': specialization,
      'contact': contact,
    });
    notifyListeners();
  }

  void removeDoctor(int index) {
    _doctors.removeAt(index);
    notifyListeners();
  }
}
