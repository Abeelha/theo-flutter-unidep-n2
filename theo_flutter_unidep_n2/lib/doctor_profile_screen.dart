import 'package:flutter/material.dart';
import 'constants.dart';

class DoctorProfileScreen extends StatefulWidget {
  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
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

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specializationController =
      TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  void _addDoctor() {
    setState(() {
      _doctors.add({
        'name': _nameController.text,
        'specialization': _specializationController.text,
        'contact': _contactController.text,
      });
      _nameController.clear();
      _specializationController.clear();
      _contactController.clear();
    });
  }

  void _removeDoctor(int index) {
    setState(() {
      _doctors.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Médico'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                filled: true,
                fillColor: backgroundColor,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _specializationController,
              decoration: InputDecoration(
                labelText: 'Especialização',
                filled: true,
                fillColor: backgroundColor,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _contactController,
              decoration: InputDecoration(
                labelText: 'Contato',
                filled: true,
                fillColor: backgroundColor,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addDoctor,
              style: ElevatedButton.styleFrom(backgroundColor: secondaryColor),
              child: Text('Adicionar Médico'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _doctors.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_doctors[index]['name']!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Especialização: ${_doctors[index]['specialization']}'),
                        Text('Contato: ${_doctors[index]['contact']}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeDoctor(index),
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
