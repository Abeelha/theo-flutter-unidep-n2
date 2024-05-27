// Este arquivo define a tela de perfil do médico, onde os usuários podem adicionar,
// visualizar e remover perfis de médicos.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'constants.dart';

class DoctorProfileScreen extends StatefulWidget {
  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specializationController =
      TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  // Método para adicionar um perfil de médico
  void _addDoctor() {
    if (_nameController.text.isNotEmpty &&
        _specializationController.text.isNotEmpty &&
        _contactController.text.isNotEmpty) {
      Provider.of<AppState>(context, listen: false).addDoctor(
        _nameController.text,
        _specializationController.text,
        _contactController.text,
      );
      _nameController.clear();
      _specializationController.clear();
      _contactController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Médico', style: TextStyle(color: color1)),
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: color1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(color: blackColor),
                filled: true,
                fillColor: backgroundColor,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _specializationController,
              decoration: InputDecoration(
                labelText: 'Especialização',
                labelStyle: TextStyle(color: blackColor),
                filled: true,
                fillColor: backgroundColor,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _contactController,
              decoration: InputDecoration(
                labelText: 'Contato',
                labelStyle: TextStyle(color: blackColor),
                filled: true,
                fillColor: backgroundColor,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addDoctor,
              style: ElevatedButton.styleFrom(backgroundColor: secondaryColor),
              child: Text('Adicionar Médico', style: TextStyle(color: color1)),
            ),
            Expanded(
              child: Consumer<AppState>(
                builder: (context, appState, child) {
                  return ListView.builder(
                    itemCount: appState.doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = appState.doctors[index];
                      return ListTile(
                        title: Text(doctor['name']!,
                            style: TextStyle(color: blackColor)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Especialização: ${doctor['specialization']}',
                                style: TextStyle(color: blackColor)),
                            Text('Contato: ${doctor['contact']}',
                                style: TextStyle(color: blackColor)),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: blackColor),
                          onPressed: () => appState.removeDoctor(index),
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
