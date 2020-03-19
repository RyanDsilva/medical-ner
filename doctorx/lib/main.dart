import 'package:doctorx/views/home.dart';
import 'package:doctorx/views/query.dart';
import 'package:doctorx/views/result.dart';
import 'package:flutter/material.dart';

void main() => runApp(DoctorX());

class DoctorX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoctorX',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.lightBlueAccent,
        fontFamily: 'Poppins',
      ),
      routes: {
        '/': (context) => HomePage(),
        'query': (context) => QueryPage(),
        'result': (context) => ResultsPage(),
      },
    );
  }
}
