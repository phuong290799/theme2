import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  late int id;
  late String taskName;
  late String division;
  late String branding;
  Todo._internal();
  Todo(this.id,this.taskName,this.branding,this.division);


  @override
   List<Object> get props => [id];
  Map<String, dynamic> toMap() {
    return Map<String, dynamic>()
      ..["id"] = id
      ..["task_name"] = taskName
      ..["division"] =division
      ..["branding"] = branding
    ;
  }

  static Todo formJson(Map<String, dynamic> json) {
    return Todo._internal()
      ..id = json["id"]
      ..taskName = json["task_name"]
      ..division = json["division"]
      ..branding = json["branding"];
  }



}