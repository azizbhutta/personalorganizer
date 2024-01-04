import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../DbHelper/friend_database.dart';
import '../Models/friend_model.dart';
import 'friendlist_screen.dart';
import 'home_screen.dart';

class EditFriendScreen extends StatefulWidget {
  const EditFriendScreen({super.key});

  @override
  State<EditFriendScreen> createState() => _EditFriendScreenState();
}

class _EditFriendScreenState extends State<EditFriendScreen> {
  String? selectedGender;
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  XFile? _imageFile;



  late Future<List<FriendModel>> friendList;
  FriendDBHelper? dbHelper;


  @override
  void initState() {
    super.initState();
    dbHelper = FriendDBHelper();
    loadData();
  }

  loadData() async {
    friendList = dbHelper!.get();
    setState(() {});
  }

  void deleteFriend(int id) async {
    await dbHelper!.delete(id);
    // Reload the data after deletion
    loadData();
  }



  // void showEditDialog(FriendModel friend) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Edit Friend'),
  //         content: Column(
  //           children: [
  //             // Add TextFormFields or other input widgets for each field
  //             // and pre-fill them with the existing data
  //             TextFormField(
  //               controller: nameController,
  //               decoration: const InputDecoration(labelText: 'First Name'),
  //
  //             ),
  //             TextFormField(
  //               controller: lastnameController,
  //               decoration: const InputDecoration(labelText: 'Last Name'),
  //
  //             ),
  //             // Repeat for other fields
  //
  //             ElevatedButton(
  //               onPressed: () {
  //                 // Perform the update in the database
  //                 // You might want to add validation checks here
  //                 dbHelper!.update(
  //                   FriendModel(
  //                     id: friend.id,
  //                     firstname: nameController.text,
  //                     lastname: lastnameController.text,
  //                     age: ageController.hashCode,
  //                     address: addressController.text,
  //                     photoname: '',
  //                     gender: '',
  //                     // Set other properties as needed
  //                   ),
  //                 );
  //
  //                 // Reload the data after update
  //                 loadData();
  //
  //                 // Close the dialog
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text('Update'),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }


  // void showEditFirstNameDialog(FriendModel friend) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Edit First Name'),
  //         content: Column(
  //           children: [
  //             TextFormField(
  //               controller: nameController,
  //               decoration: const InputDecoration(labelText: 'First Name'),
  //               initialValue: friend.firstname.toString(),
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 // Update only the first name in the database
  //                 dbHelper!.update(friend.id);
  //                 // Reload the data after update
  //                 loadData();
  //                 // Close the dialog
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text('Update'),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const FriendListScreen()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff607D8B),
          title: const Text(
            'Friend Detail',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              icon: const Icon(Icons.home),
              color: Colors.white,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
          child: FutureBuilder(
            future: friendList,
            builder: (BuildContext context, AsyncSnapshot<List<FriendModel>> snapshot) {
              if(snapshot.hasData){
               return  ListView.builder(
                   itemCount: snapshot.data?.length,
                   itemBuilder: (context, index){
                     return Column(
                       children: [
                         Center(
                           child: Container(
                             height: 150,
                             width: 150,
                             decoration:  BoxDecoration(
                                 image: DecorationImage(
                                     image: FileImage(File(snapshot.data![index].photoname.toString())), fit: BoxFit.cover),
                                 shape: BoxShape.circle),
                           ),
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Center(
                           child: Container(
                             height: 35,
                             width: 90,
                             decoration:  BoxDecoration(
                                 borderRadius: BorderRadius.circular(5),
                                 color: const Color(0xff607D8B)
                             ),
                             child: const Center(child: Text('Edit',style: TextStyle(fontSize: 15,color: Colors.white),)),
                           ),
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 20, right: 20),
                           child: Row(
                             children: [
                               const Text(
                                 'First Name:',
                                 style: TextStyle(
                                   fontSize: 18.0,
                                   fontWeight: FontWeight.w900,
                                 ),
                               ),
                               const SizedBox(
                                 width: 10,
                               ),
                               Expanded(
                                 child: Text(
                                   snapshot.data![index].firstname.toString(),
                                   style: const TextStyle(
                                     fontSize: 16.0,
                                   ),
                                 ),
                               ),
                               IconButton(
                                 icon: const Icon(Icons.edit),
                                 onPressed: () {
                                   // showEditFirstNameDialog(snapshot.data![index]);
                                 },
                               ),
                             ],
                           ),
                         ),
                         const SizedBox(height: 10.0),
                         Padding(
                           padding: const EdgeInsets.only(left: 20,right: 20),
                           child: Row(
                             children: [
                               const Text(
                                 'Last Name:',
                                 style: TextStyle(
                                   fontSize: 18.0,
                                   fontWeight: FontWeight.w900,
                                 ),
                               ),
                               const SizedBox(
                                 width: 10,
                               ),
                                Expanded(
                                 child: Text(
                                   snapshot.data![index].lastname.toString(),
                                   style: const TextStyle(
                                     fontSize: 16.0,
                                   ),
                                 ),
                               ),
                               IconButton(
                                 icon: const Icon(Icons.edit),
                                 onPressed: () {
                                 },
                               ),
                             ],
                           ),
                         ),
                         const SizedBox(height: 10.0),
                         Padding(
                           padding: const EdgeInsets.only(left: 20,right: 20),
                           child: Row(
                             children: [
                               const Text(
                                 'Gender:',
                                 style: TextStyle(
                                   fontSize: 18.0,
                                   fontWeight: FontWeight.w900,
                                 ),
                               ),
                               const SizedBox(
                                 width: 10,
                               ),
                               Expanded(
                                 child: Text(
                                   snapshot.data![index].gender.toString(),
                                   style: const TextStyle(
                                     fontSize: 16.0,
                                   ),
                                 ),
                               ),
                               IconButton(
                                 icon: const Icon(Icons.edit),
                                 onPressed: () {

                                 },
                               ),
                             ],
                           ),
                         ),
                         const SizedBox(height: 10.0),
                         Padding(
                           padding: const EdgeInsets.only(left: 20,right: 20),
                           child: Row(
                             children: [
                               const Text(
                                 'Age:',
                                 style: TextStyle(
                                   fontSize: 18.0,
                                   fontWeight: FontWeight.w900,
                                 ),
                               ),
                               const SizedBox(
                                 width: 10,
                               ),
                                Expanded(
                                 child: Text(
                                   snapshot.data![index].age.toString(),
                                   style: const TextStyle(
                                     fontSize: 16.0,
                                   ),
                                 ),
                               ),
                               IconButton(
                                 icon: const Icon(Icons.edit),
                                 onPressed: () {

                                 },
                               ),
                             ],
                           ),
                         ),
                         const SizedBox(height: 10.0),
                         Padding(
                           padding: const EdgeInsets.only(left: 20,right: 20),
                           child: Row(
                             children: [
                               const Text(
                                 'Address:',
                                 style: TextStyle(
                                   fontSize: 18.0,
                                   fontWeight: FontWeight.w900,
                                 ),
                               ),
                               const SizedBox(
                                 width: 10,
                               ),
                               const Expanded(
                                 child: Text(
                                   'Multan',
                                   style: TextStyle(
                                     fontSize: 16.0,
                                   ),
                                 ),
                               ),
                               IconButton(
                                 icon: const Icon(Icons.edit),
                                 onPressed: () {

                                 },
                               ),
                             ],
                           ),
                         ),
                         const SizedBox(height: 20.0),
                         ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(5.0)),
                             backgroundColor: const Color(0xff5D7F8B),
                             padding:  const EdgeInsets.symmetric(
                                 horizontal: 20,
                                 vertical: 5),
                           ),
                           onPressed: () {
                             deleteFriend(snapshot.data![index].id!); // Pass the friend's ID
                           },
                           child: const Text(
                             'Delete',
                             style: TextStyle(fontSize: 17, color: Colors.white),
                           ),
                         ),

                       ],
                     );
                   }
                   );
              } else {
                return Center(
                  child: Container(
                      child: const Text("No Data Found", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}




