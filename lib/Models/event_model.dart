

class EventModel {
  final int? id;
  final String eventname;
  final String location;
  final DateTime date;


  EventModel({
    this.id,
    required this.eventname,
    required this.location,
    required this.date,

  });

  EventModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        eventname = res["eventname"],
        location = res["location"],
        date = res["date"];


  Map<String, Object?> toMap() {
    return {'id':id, 'eventname': eventname, 'location': location, 'date': date, };
  }
}