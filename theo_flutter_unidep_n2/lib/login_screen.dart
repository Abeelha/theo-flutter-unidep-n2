import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text == 'admin' &&
        _passwordController.text == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nome de usuário ou senha inválidos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Nome de Usuário',
                  filled: true,
                  fillColor: backgroundColor,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  filled: true,
                  fillColor: backgroundColor,
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style:
                    ElevatedButton.styleFrom(backgroundColor: secondaryColor),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}