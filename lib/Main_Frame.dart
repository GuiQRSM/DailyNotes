import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class MainDN extends StatefulWidget {
  const MainDN({Key? key}) : super(key: key);

  @override
  _MainDNState createState() => _MainDNState();
}

class _MainDNState extends State<MainDN> {

  var mainColor = Color.fromRGBO(220, 20, 60, 1);
  var secondaryColor =  Color.fromRGBO(240, 128, 128, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        title: Text("Daily Notes"),
        backgroundColor: mainColor,
        titleTextStyle: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: secondaryColor,
        ),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
          label: Text(
            "add a note",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          icon: Icon(
            Icons.note_add,
          ),
          backgroundColor: mainColor,
          foregroundColor: secondaryColor,
          elevation: 22,
          onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
