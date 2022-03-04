//@dart=2.9
import 'package:daily_notes/models/Annotations_Model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RegistrationHelper {

  static final String _tableName = "notes";

  static final RegistrationHelper _instanceRegistration = RegistrationHelper._internal();

  Database _db;

  factory RegistrationHelper(){
    return _instanceRegistration;
  }

  RegistrationHelper._internal(){

  }

  get database async {

    if( _db != null ){
      return _db;
    }else{
      _db = await initializeDataBase();
      return _db;
    }

  }

  _createSqlTable(Database db, int version) async {

    String bornTable = "CREATE TABLE $_tableName ("
        "id INTEGER PRIMARY KRY AUTOINCREMENT,"
        " title VARCHAR,"
        " description TEXT,"
        " date DATETIME"
        "  )";
    await db.execute(bornTable);

  }

  initializeDataBase() async {

    final databaseRoad = await getDatabasesPath();
    final databaseLocal = join(databaseRoad, "daily_notes_data.db");

    var databaseDefinitive = await openDatabase(
      databaseLocal,
      version: 1,
      onCreate: _createSqlTable,
    );
    return databaseDefinitive;
  }

  Future<int> saveNoteHelper(AnnotationModel infoNote) async {

    var receiveGetNaming = database;
    int id = await receiveGetNaming.insert(_tableName, infoNote.toMap());

  }

}