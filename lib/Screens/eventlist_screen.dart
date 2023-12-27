import 'package:flutter/material.dart';
import 'package:personalorganizer/Screens/addevevent_screen.dart';
import 'eventdetail_screen.dart';
import 'home_screen.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key});

  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  bool isCheckBoxSelected = false;

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
              'Personal Organizer System',
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            actions: [
              if (isCheckBoxSelected)
                IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.white,
                ),
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
                Text('COMING EVENTS'),
                Text('PAST EVENTS'),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(),
            ),
          ),
          body:  TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const EventDetailScreen()),
                        );
                      },
                      child: Container(
                          padding: const EdgeInsets.only( left: 5),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1),
                              border: Border.all(
                                color: const Color(0xff607D8B),
                                width: .1,
                              )),
                          child: Row(
                            children: [
                              Checkbox(
                                value: isCheckBoxSelected, // Step 2: Set checkbox value
                                onChanged: (value) {
                                  setState(() {
                                    isCheckBoxSelected = value ?? false;
                                  });
                                },
                                activeColor: const Color(0xff607D8B),
                              ),
                              const Text(
                                'Faraz',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              ),
                            ],
                          )
                      ),
                    )
                  ],
                ),
              ),

              // 2nd Tab details

              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const EditFriendScreen()),
                        // );
                      },
                      child: Container(
                          padding: const EdgeInsets.only( left: 5),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1),
                              border: Border.all(
                                color: const Color(0xff607D8B),
                                width: .1,
                              )),
                          child: Row(
                            children: [
                              Checkbox(
                                value: isCheckBoxSelected, // Step 2: Set checkbox value
                                onChanged: (value) {
                                  setState(() {
                                    isCheckBoxSelected = value ?? false;
                                  });
                                },
                                activeColor: const Color(0xff607D8B),
                              ),
                              const Text(
                                'Faraz',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              ),
                            ],
                          )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddEventScreen()));
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
