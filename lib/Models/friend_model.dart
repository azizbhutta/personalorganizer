

class FriendModel {
  final int? id;
  final String firstname;
  final String lastname;
  final int age;
  final String address;
  String photoname;

  FriendModel({
    this.id,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.address,
    required this.photoname
  });

  FriendModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        firstname = res["firstname"],
        lastname = res["lastname"],
        age = res["age"],
        address = res["address"],
        photoname = res["photoname"];

  Map<String, Object?> toMap() {
    return {'id':id, 'firstname': firstname, 'lastname': lastname, 'age': age, 'address': address,'photoname': photoname};
  }
}