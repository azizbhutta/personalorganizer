import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:personalorganizer/Screens/tasklist_screen.dart';
import 'eventlist_screen.dart';
import 'friendlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Handle the picked image file, you can save or use it as needed.
      print("Image picked: ${pickedFile.path}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        // Return true to allow the pop, or false to prevent it.
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                const Text('Personal',style: TextStyle( fontSize: 50,fontWeight: FontWeight.w800,color: Colors.black),),
                const Text('Organizer',style: TextStyle( fontSize: 50,fontWeight: FontWeight.w800,color: Colors.black),),
                const Text('System',style: TextStyle( fontSize: 50,fontWeight: FontWeight.w800,color: Colors.black),),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70,right: 70),
                  child: Row(
                    children: [
                      InkWell(
                        onTap :(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const FriendListScreen()));
                         },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff3CB371),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.people_outline_rounded,size: 20,color: Colors.white,),
                              Text('Friends',style: TextStyle(fontSize: 14,color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      InkWell(
                        onTap :(){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const TaskListScreen()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff812122),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.task_alt,size: 20,color: Colors.white,),
                              Text('Tasks',style: TextStyle(fontSize: 14,color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70,right: 70),
                  child: Row(
                    children: [
                      InkWell(
                        onTap :(){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const EventListScreen()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffA6870A),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.event,size: 20,color: Colors.white,),
                              Text('Events',style: TextStyle(fontSize: 14,color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      InkWell(
                        onTap: () {
                          _pickImage();
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff1A4C6D),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image,size: 20,color: Colors.white,),
                              Text('Images',style: TextStyle(fontSize: 14,color: Colors.white),)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
