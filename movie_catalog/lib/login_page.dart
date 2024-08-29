import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _password = '';

  Future<void> _login() async {
    final prefs = await SharedPreferences.getInstance();
    final storedName = prefs.getString('name') ?? '';
    final storedPassword = prefs.getString('password') ?? '';

    if (_name == storedName && _password == storedPassword) {
      Navigator.pushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid Credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30), // Space before the title
            Text(
              'MOVIE CATALOG',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.cyanAccent[400],
              ),
            ),
            SizedBox(height: 8), // Space between title and subtitle
            Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30), // Space between subtitle and form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    onChanged: (value) => _name = value,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your name' : null,
                  ),
                  SizedBox(height: 16), // Space between fields
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    onChanged: (value) => _password = value,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your password' : null,
                    obscureText: true,
                  ),
                  SizedBox(height: 24), // Space between fields and button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login();
                      }
                    },
                    child: Text('Login',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent[400],
                    ),
                  ),
                  SizedBox(height: 20), // Space between button and small text
                  Text(
                    'Or login with',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8), // Space between small text and icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.g_mobiledata_sharp, color: Color.fromARGB(255, 222, 85, 5),size: 35,),
                        onPressed: () {
                          // Google login logic here
                        },
                      ),
                      SizedBox(width: 16), // Space between icons
                      IconButton(
                        icon: Icon(Icons.facebook, color: Colors.blue,),
                        onPressed: () {
                          // Facebook login logic here
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
