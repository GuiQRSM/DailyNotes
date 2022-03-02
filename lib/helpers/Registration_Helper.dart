import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RegistrationHelper {

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

    }

    _createSqlTable(Database db, int version) async {



    }

    InitializeDataBase() async {

      final databaseRoad = await getDatabasesPath();
      final databaseLocal = join(databaseRoad, "daily_notes_data.db");

      var databaseDefinitive = await openDatabase(
        databaseLocal,
        version: 1,
        onCreate: (){},
      );
      return databaseDefinitive;

    }

  }

}