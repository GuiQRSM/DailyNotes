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
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  _dialogAddAndSave() {

    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Add a new note:"),
            titleTextStyle: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
              color: mainColor,
            ),
            backgroundColor: secondaryColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  autofocus: true,
                  cursorColor: mainColor,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ),
                  decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: mainColor,
                    ),
                    hintText: "Write the title...",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: mainColor,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                  ),
                ),
                TextField(
                  controller: _descriptionController,
                  autofocus: true,
                  cursorColor: mainColor,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: mainColor,
                  ),
                  decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: mainColor,
                    ),
                    hintText: "Write the description...",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: mainColor,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor),
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                padding: EdgeInsets.all(10),
                color: mainColor,
                textColor: secondaryColor,
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                color: mainColor,
                textColor: secondaryColor,
                child: Text("Save"),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
    );

  }

  _saveAnnotations() {

    String getTitleNote = _titleController.text;
    String getDescNote = _descriptionController.text;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        title: Text("Daily Notes"),
        backgroundColor: mainColor,
        titleTextStyle: TextStyle(
          fontSize: 22,
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
          onPressed: (){
            _dialogAddAndSave();
          },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
