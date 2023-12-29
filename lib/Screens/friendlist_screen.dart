// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../DbHelper/friend_database.dart';
// import '../Models/friend_model.dart';
// import 'addfriend_screen.dart';
// import 'editfriend-screen.dart';
// import 'home_screen.dart';
//
// class FriendListScreen extends StatefulWidget {
//   const FriendListScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FriendListScreen> createState() => _FriendListScreenState();
// }
//
// class _FriendListScreenState extends State<FriendListScreen> {
//   TextEditingController nameController = TextEditingController();
//
//
//   late Future<List<FriendModel>> friendList;
//
//   Future<List>? _friend;
//   FriendDBHelper? dbHelper;
//
//
//   @override
//   void initState() {
//     super.initState();
//     dbHelper = FriendDBHelper();
//     loadData();
//   }
//
//   loadData() async{
//     friendList = dbHelper!.get();
//
//     print(friendList.toString());
//
//     setState(() {
//       _friend = friendList;
//     });
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const HomeScreen()),
//         );
//         return false;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: const Color(0xff607D8B),
//           title: const Text(
//             'Friends',
//             style: TextStyle(
//                 color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const HomeScreen()));
//               },
//               icon: const Icon(Icons.home),
//               color: Colors.white,
//             ),
//           ],
//         ),
//         body: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
//               child: Stack(
//                 children: [
//                   Column(
//                     children: [
//                       InkWell(
//                         onTap: (){
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (context) => const EditFriendScreen()),
//                           );
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.only(top: 8, left: 10),
//                           height: 40,
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(1),
//                               border: Border.all(
//                                 color: const Color(0xff607D8B),
//                                 width: .1,
//                               )),
//                           child: const Text(
//                             'Faraz',
//                             style: TextStyle(fontSize: 15, color: Colors.black),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Positioned(
//                     bottom: 16.0,
//                     right: 16.0,
//                     child: FloatingActionButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) => const AddFriendScreen()),
//                         );
//                       },
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
//                       backgroundColor: const Color(0xff607D8B),
//                       child: const Icon(
//                         Icons.add,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../DbHelper/friend_database.dart';
import '../Models/friend_model.dart';
import 'addfriend_screen.dart';
import 'editfriend-screen.dart';
import 'home_screen.dart';

class FriendListScreen extends StatefulWidget {
  const FriendListScreen({Key? key}) : super(key: key);

  @override
  State<FriendListScreen> createState() => _FriendListScreenState();
}

class _FriendListScreenState extends State<FriendListScreen> {
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
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff607D8B),
          title: const Text(
            'Friends',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              icon: const Icon(Icons.home),
              color: Colors.white,
            ),
          ],
        ),
        body: FutureBuilder<List<FriendModel>>(
          future: friendList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No friends available.'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  FriendModel friend = snapshot.data![index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditFriendScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 8, left: 10),
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        border: Border.all(
                          color: const Color(0xff607D8B),
                          width: 0.1,
                        ),
                      ),
                      child: Text(
                        friend.firstname,
                        style: const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AddFriendScreen()),
            );
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: const Color(0xff607D8B),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}




