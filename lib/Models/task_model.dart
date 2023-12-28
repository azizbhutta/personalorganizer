

class TaskModel {
  final int? id;
  final String taskname;
  final String location;


  TaskModel({
    this.id,
    required this.taskname,
    required this.location,

  });

  TaskModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        taskname = res["taskname"],
        location = res["location"];


  Map<String, Object?> toMap() {
    return {'id':id, 'taskname': taskname, 'location': location,};
  }
}