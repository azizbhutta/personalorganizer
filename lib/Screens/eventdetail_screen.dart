import 'package:flutter/material.dart';
import 'eventlist_screen.dart';
import 'home_screen.dart';


class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
            'Event Detail',
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
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Event Name:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.black),),
                Text('New Event',style: TextStyle(fontSize: 18,color: Colors.black),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Event Location:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.black),),
                Text('Multan',style: TextStyle(fontSize: 18,color: Colors.black),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Event Date:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.black),),
                Text('26/12/23',style: TextStyle(fontSize: 18,color: Colors.black),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Event Time:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Colors.black),),
                Text('15:9',style: TextStyle(fontSize: 18,color: Colors.black),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
