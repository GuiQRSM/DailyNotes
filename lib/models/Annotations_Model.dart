//@dart=2.9

class AnnotationModel {

  int id;
  String title;
  String description;
  String date;

  AnnotationModel(this.id, this.title, this.description, this.date);

  AnnotationModel.fromMap(Map mapConverter){

    this.id = mapConverter["id"];
    this.title = mapConverter["title"];
    this.description = mapConverter["description"];
    this.date = mapConverter["date"];

  }

  Map toMap() {

    Map<String, dynamic> mapRecords = {
      "title": this.title,
      "description": this.description,
      "date": this.date,
    };

    if( this.id != null ){
      mapRecords["id"] = this.id;
    }

    return mapRecords;

  }

}