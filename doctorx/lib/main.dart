import 'package:doctorx/views/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(DoctorX());

class DoctorX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoctorX',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
