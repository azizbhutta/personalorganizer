import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'eventlist_screen.dart';
import 'home_screen.dart';


class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {

  TextEditingController eventnameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();


  var hour = 0;
  var minute = 0;
  var timeFormat = "AM";



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
                controller: eventnameController,
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
                controller: locationController,
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
                controller: dateController,
                textInputAction: TextInputAction.done,
                cursorColor: const Color(0xff919191),
                decoration: const InputDecoration(
                  hintText: 'Event Date',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff919191)),
                  ),
                ),
              ),

              // Text(
              //     "Pick Your Time! ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}",
              //     style:
              //     const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumberPicker(
                      minValue: 0,
                      maxValue: 12,
                      value: hour,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 50,
                      itemHeight: 40,
                      onChanged: (value) {
                        setState(() {
                          hour = value;
                        });
                      },
                      textStyle:
                      const TextStyle(color: Colors.grey, fontSize: 15),
                      selectedTextStyle:
                      const TextStyle(color: Colors.black, fontSize: 15),
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: Colors.black,
                            ),
                            bottom: BorderSide(color: Colors.black)),
                      ),
                    ),
                    NumberPicker(
                      minValue: 0,
                      maxValue: 59,
                      value: minute,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 50,
                      itemHeight: 40,
                      onChanged: (value) {
                        setState(() {
                          minute = value;
                        });
                      },
                      textStyle:
                      const TextStyle(color: Colors.grey, fontSize: 15),
                      selectedTextStyle:
                      const TextStyle(color: Colors.black, fontSize: 15),
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                              color: Colors.black,
                            ),
                            bottom: BorderSide(color: Colors.black)),
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              timeFormat = "AM";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: timeFormat == "AM"
                                    ? Color(0xff607D8B)
                                    : Colors.grey.shade700,
                                border: Border.all(
                                  color: timeFormat == "AM"
                                      ? Colors.grey
                                      : Colors.grey.shade700,
                                )),
                            child: const Text(
                              "AM",
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              timeFormat = "PM";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: timeFormat == "PM"
                                  ? Color(0xff607D8B)
                                  : Colors.grey.shade700,
                              border: Border.all(
                                color: timeFormat == "PM"
                                    ? Colors.grey
                                    : Colors.grey.shade700,
                              ),
                            ),
                            child: const Text(
                              "PM",
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
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
