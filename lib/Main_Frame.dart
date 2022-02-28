import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class MainDN extends StatefulWidget {
  const MainDN({Key? key}) : super(key: key);

  @override
  _MainDNState createState() => _MainDNState();
}

class _MainDNState extends State<MainDN> {

  var mainColor = Color.fromRGBO(255, 127, 80, 1);
  var secondaryColor =  Color.fromRGBO(240, 128, 128, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
    );
  }
}
