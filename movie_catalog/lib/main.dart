import 'package:flutter/material.dart';
import 'home_page.dart';
import 'company_info.dart';
import 'signup_page.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/companyInfo': (context) => CompanyInfoPage(),
      },
    );
  }
}
