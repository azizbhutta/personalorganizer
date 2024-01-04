

class EventModel {
  final int? id;
  final String eventname;
  final String location;
  // DateTime dateTime;
  String todoDate;
  String time;


  EventModel({
    this.id,
    required this.eventname,
    required this.location,
    // required this.dateTime,
    required this.time,
    required this.todoDate,

  });

  EventModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        eventname = res["eventname"],
        location = res["location"],
        // dateTime = res["dateTime"],
        time = res ["time"],
        todoDate=res ["todoDate"];



  Map<String, Object?> toMap() {
    return {'id':id, 'eventname': eventname, 'location': location, 'todoDate':todoDate, 'time':time };
  }
}