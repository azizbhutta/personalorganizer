import 'package:flutter/material.dart';
import '../DbHelper/task_database.dart';
import '../Models/task_model.dart';
import 'addtask_screen.dart';
import 'home_screen.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late Future<List<TaskModel>> taskList;
  TaskDBHelper? dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = TaskDBHelper();
    loadData();
  }

  loadData() async {
    taskList = dbHelper!.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        return false;
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xff607D8B),
            title: const Text(
              'Task',
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
            bottom: const TabBar(
              tabs: [
                Text('PENDING TASKS'),
                Text('COMPLETED TASKS'),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(),
            ),
          ),
          body:  TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Pending Tasks Content',style: TextStyle(fontSize:15, color: Color(0xff7D7D7D)),),
                        TextButton(onPressed: (){

                        },
                            child: const Text('Mark as done',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w800),))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Pending Tasks Content',style: TextStyle(fontSize:15, color: Color(0xff7D7D7D)),),
                        TextButton(onPressed: (){

                        },
                            child: const Text('Mark as done',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w800),))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Pending Tasks Content',style: TextStyle(fontSize:15, color: Color(0xff7D7D7D)),),
                        TextButton(onPressed: (){

                        },
                            child: const Text('Mark as done',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w800),))
                      ],
                    ),
                  ],
                ),
              ),

               // 2nd Tab details

               Padding(
                 padding: const EdgeInsets.only(left: 20,right: 20),
                 child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                            width: 285,
                            child: Text('New Task',style: TextStyle(fontSize: 15),),
                        ),
                        IconButton(onPressed: (){
                        },
                            icon: const Icon(Icons.edit,color: Color(0xff7D7D7D),)),
                        IconButton(onPressed: (){
                        },
                            icon: const Icon(Icons.delete,color: Color(0xff7D7D7D),)),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 285,
                          child: Text('New Task',style: TextStyle(fontSize: 15),),
                        ),
                        IconButton(onPressed: (){
                        },
                            icon: const Icon(Icons.edit,color: Color(0xff7D7D7D),)),
                        IconButton(onPressed: (){
                        },
                            icon: const Icon(Icons.delete,color: Color(0xff7D7D7D),)),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 285,
                          child: Text('New Task',style: TextStyle(fontSize: 15),),
                        ),
                        IconButton(onPressed: (){
                        },
                            icon: const Icon(Icons.edit,color: Color(0xff7D7D7D),)),
                        IconButton(onPressed: (){
                        },
                            icon: const Icon(Icons.delete,color: Color(0xff7D7D7D),)),
                      ],
                    ),
                  ],
                               ),
               )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddTaskScreen()));
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            backgroundColor: const Color(0xff607D8B),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
