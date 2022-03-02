import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RegistrationHelper {

  static final RegistrationHelper _instanceRegistration = RegistrationHelper._internal();

  factory RegistrationHelper(){
    return _instanceRegistration;
  }

  RegistrationHelper._internal(){

  }

}