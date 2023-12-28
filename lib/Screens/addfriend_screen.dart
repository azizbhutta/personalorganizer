import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:personalorganizer/Screens/friendlist_screen.dart';

import '../DbHelper/friend_database.dart';
import '../Models/friend_model.dart';
import 'home_screen.dart';

class AddFriendScreen extends StatefulWidget {
  const AddFriendScreen({super.key});

  @override
  State<AddFriendScreen> createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends State<AddFriendScreen> {
  final formKey = GlobalKey<FormState>();
  String? selectedGender;
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  FriendDBHelper? dbHelper;


  // TODO Add Account Data
  validation() {
    if (formKey.currentState!.validate()) {
      dbHelper
          ?.insert(FriendModel(
        age: int.parse(ageController.text.toString()),
        firstname: nameController.text.toString(),
        lastname: lastnameController.text.toString(),
        address: addressController.text.toString(),
      ))
          .then((value) {
        print("Data Added");
        Fluttertoast.showToast(msg: "Data Added");
        ageController.clear();
        nameController.clear();
        lastnameController.clear();
        addressController.clear();
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    } else {
      Fluttertoast.showToast(msg: 'Please Provide the required information');
      print("Enter The Information in the Textfields");

    }
  }

  @override
  void initState() {
    super.initState();
    dbHelper = FriendDBHelper();
  }



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
            'Add Friend',
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
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: IconButton(onPressed: () {
                  },
                      icon: const Icon(Icons.person_rounded,size: 120,color: Color(0xff757575),)),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  cursorColor: const Color(0xff919191),
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff919191)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Provide Your FirstName";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: lastnameController,
                  cursorColor: const Color(0xff919191),
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff919191)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Provide Your LastName";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: ageController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  cursorColor: const Color(0xff919191),
                  decoration: const InputDecoration(
                    hintText: 'Age',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff919191)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Provide Your Age";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: addressController,
                  textInputAction: TextInputAction.next,
                  cursorColor: const Color(0xff919191),
                  decoration: const InputDecoration(
                    hintText: 'Address',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff919191)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Provide Your Address";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  activeColor: const Color(0xff13D7CD),
                ),
                const Text('Male'),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Female',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  activeColor: const Color(0xff13D7CD),
                ),
                const Text('Female'),
                  ],
                ),
               ],
             ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        backgroundColor: const Color(0xff607D8B),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10)
                    ),
                    onPressed: () {
                      validation();
                    },
                    child: const Text(
                      'ADD',
                      style: TextStyle(fontSize: 17,color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
