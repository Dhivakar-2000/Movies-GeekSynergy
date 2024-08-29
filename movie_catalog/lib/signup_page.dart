import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _password = '';
  String _email = '';
  String _phone = '';
  String _profession = '';
  List<String> _professions = ['Engineer', 'Doctor', 'Artist', 'Other'];

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _name);
    await prefs.setString('password', _password);
    await prefs.setString('email', _email);
    await prefs.setString('phone', _phone);
    await prefs.setString('profession', _profession);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 60), // Increase height to push titles down
            Text(
              'MOVIES CATALOG',
              style: TextStyle(
                fontSize: 24,
                color:  Colors.cyanAccent[400],
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 40), // Add space between titles and form
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(fontStyle: FontStyle.italic),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) => _name = value,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter your name' : null,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontStyle: FontStyle.italic),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) => _password = value,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter your password' : null,
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(fontStyle: FontStyle.italic),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) => _email = value,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter your email' : null,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(fontStyle: FontStyle.italic),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) => _phone = value,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter your phone number' : null,
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: 'Profession',
                          labelStyle: TextStyle(fontStyle: FontStyle.italic),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Colors.white,
                        items: _professions
                            .map((profession) => DropdownMenuItem(
                                  child: Text(profession),
                                  value: profession,
                                ))
                            .toList(),
                        onChanged: (value) => _profession = value.toString(),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyanAccent[400],
                            textStyle: TextStyle(fontStyle: FontStyle.italic),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _saveData();
                              Navigator.pushNamed(context, '/login');
                            }
                          },
                          child: Text('Sign Up',
                          style: TextStyle(color: Colors.white),)
                          ,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
