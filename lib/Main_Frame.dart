//@dart=2.9
import 'package:daily_notes/helpers/Registration_Helper.dart';
import 'package:daily_notes/models/Annotations_Model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class MainDN extends StatefulWidget {
  const MainDN({Key key}) : super(key: key);

  @override
  _MainDNState createState() => _MainDNState();
}

class _MainDNState extends State<MainDN> {

  var mainColor = Color.fromRGBO(220, 20, 60, 1);
  var secondaryColor =  Color.fromRGBO(240, 128, 128, 1);
  var cardColor = Color.fromRGBO(255, 218, 185, 1);
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  var _databaseHelper = RegistrationHelper();
  List<AnnotationModel> _annotationModelList = List<AnnotationModel>();

  dynamic get description => _descriptionController.text;

  dynamic get title => _titleController.text;

  dynamic get id => null;

  _dialogAddAndSave({AnnotationModel dialogUpdate}) {

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
                  _saveAnnotations();
                },
              ),
            ],
          );
        },
    );

  }

  _saveAnnotations() async {

    String getTitleNote = _titleController.text;
    String getDescNote = _descriptionController.text;

    //print("DataTimeActual: ${DateTime.now().toString()}");

    AnnotationModel infoNote = AnnotationModel(id, title, description, DateTime.now().toString());
    int rescueresult = await _databaseHelper.saveNoteHelper(infoNote);
    print("DataTimeActual: ${rescueresult.toString()}");

    _titleController.clear();
    _descriptionController.clear();

    _rescueAnnotations();

  }

  _rescueAnnotations() async {

    List recoveredNotes = await _databaseHelper.rescueNoteHelper();

    List<AnnotationModel> temporaryNotelist = List<AnnotationModel>();
    for( var runner in recoveredNotes ){

      AnnotationModel converterNotes = AnnotationModel.fromMap(runner);
      temporaryNotelist.add(converterNotes);

    }

    setState(() {
      _annotationModelList = temporaryNotelist;
    });
    temporaryNotelist = null;

    print("RescueNotesStatus: ${recoveredNotes}");

  }

  _dateFormatter(String formatted ) {

    initializeDateFormatting("pt_BR");

    var definitiveFormatter = DateFormat("d/M/y H:mm");

    DateTime formableContent = DateTime.parse(formatted);
    String converterFormatter = definitiveFormatter.format(formableContent);

    return converterFormatter;

  }

  @override
  void initState() {
    // TODO: implement initState
    _rescueAnnotations();
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
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                   itemCount: _annotationModelList.length,
                  itemBuilder: (context, index){

                     final setNotes = _annotationModelList[index];

                     return Card(
                       child: ListTile(
                         title: Text(
                             "${setNotes.title}",
                             style: TextStyle(
                               fontSize: 22,
                               fontWeight: FontWeight.w500
                             ),
                         ),
                         subtitle: Text(
                             "${_dateFormatter(setNotes.date)} - ${setNotes.description}",
                             style: TextStyle(
                               fontSize: 16,
                               fontWeight: FontWeight.w600
                             ),
                         ),
                         textColor: mainColor,
                         trailing: Row(
                           mainAxisSize: MainAxisSize.min,
                           children: <Widget>[
                             GestureDetector(
                               onTap: (){

                               },
                               child: Padding(
                                 padding: EdgeInsets.only(right: 16),
                                 child: Icon(
                                   Icons.edit,
                                   size: 27,
                                   color: mainColor,
                                 ),
                               ),
                             ),
                             GestureDetector(
                               onTap: (){

                               },
                               child: Padding(
                                 padding: EdgeInsets.only(right: 0),
                                 child: Icon(
                                   Icons.delete_forever,
                                   size: 30,
                                   color: secondaryColor,
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       color: cardColor,
                     );
                  },
              ),
          ),
        ],
      ),
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
