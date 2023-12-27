import 'package:flutter/material.dart';

import 'Timer/am_pm.dart';
import 'Timer/hours.dart';
import 'Timer/minutes.dart';
import 'eventlist_screen.dart';
import 'home_screen.dart';


class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = FixedExtentScrollController();
  }


  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const EventListScreen()),
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
          padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
          child: Column(
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                cursorColor: const Color(0xff919191),
                decoration: const InputDecoration(
                  hintText: 'Event Name',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff919191)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                cursorColor: const Color(0xff919191),
                decoration: const InputDecoration(
                  hintText: 'Location',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff919191)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                cursorColor: const Color(0xff919191),
                decoration: const InputDecoration(
                  hintText: 'Event Date',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff919191)),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // hours wheel
                  Container(
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                      controller: _controller,
                      itemExtent: 100,
                      perspective: 0.010,
                      diameterRatio: .4,
                      squeeze: 1,
                      physics: const FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 13,
                        builder: (context, index) {
                          return MyHours(
                            hours: index,
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  // minutes wheel
                  Container(
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 100,
                      perspective: 0.010,
                      diameterRatio: .4,
                      physics: const FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 60,
                        builder: (context, index) {
                          return MyMinutes(
                            mins: index,
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 15,
                  ),

                  // am or pm
                  Container(
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 100,
                      perspective: 0.005,
                      diameterRatio: 1.2,
                      physics: FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 2,
                        builder: (context, index) {
                          if (index == 0) {
                            return AmPm(
                              isItAm: true,
                            );
                          } else {
                            return AmPm(
                              isItAm: false,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
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
                  },
                  child: const Text(
                    'ADD',
                    style: TextStyle(fontSize: 17,color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
