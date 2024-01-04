import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:personalorganizer/Screens/tasklist_screen.dart';
import '../DbHelper/friend_database.dart';
import '../DbHelper/task_database.dart';
import '../Models/friend_model.dart';
import '../Models/task_model.dart';
import 'home_screen.dart';


class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController taskController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  TaskDBHelper? dbHelper;


  validation() {
    if (formKey.currentState!.validate()) {
          dbHelper
              ?.insert(TaskModel(
            taskname: taskController.text.toString(),
            location: locationController.text.toString(),


          ))
              .then((value) {
            print("Data Added");
            Fluttertoast.showToast(msg: "Data Added");
            taskController.clear();
            locationController.clear();

            setState(() {

            });
          }).onError((error, stackTrace) {
            print(error.toString());
            Fluttertoast.showToast(msg: "Failed to add task. Please try again.");
          });

    } else {
      Fluttertoast.showToast(msg: 'Please Provide the required information');
      print("Enter The Information in the Textfields");
    }
  }


  @override
  void initState() {
    super.initState();
    dbHelper = TaskDBHelper();
  }


  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TaskListScreen()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff607D8B),
          title: const Text(
            'Add Task',
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
        body:  Padding(
          padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: taskController,
                  textInputAction: TextInputAction.next,
                  cursorColor: const Color(0xff919191),
                  decoration: const InputDecoration(
                    hintText: 'Task Name',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff919191)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Provide Your TaskName";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: locationController,
                  textInputAction: TextInputAction.done,
                  cursorColor: const Color(0xff919191),
                  decoration: const InputDecoration(
                    hintText: 'Location',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff919191)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Provide Your Location";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
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
                      style: TextStyle(fontSize: 17,color: Colors.black),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
