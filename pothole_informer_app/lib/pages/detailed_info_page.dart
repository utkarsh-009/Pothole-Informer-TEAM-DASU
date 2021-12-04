// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:pothole_informer_app/routes.dart';
// import 'package:pothole_informer_app/utils/themes.dart';

// class DetailsPage extends StatefulWidget {
//   const DetailsPage({Key? key}) : super(key: key);

//   @override
//   _DetailsPageState createState() => _DetailsPageState();
// }

// class _DetailsPageState extends State<DetailsPage> {
//   List<String> add = [];
//   List<String> city = [];
//   List<String> desc = [];
//   List<String> ph_no = [];
//   late Stream myStream;

//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("Pothole Details")
//         .snapshots()
//         .listen((event) {
//       setState(() {
//         add = List.generate(event.docs.length,
//             (index) => event.docs[index].data()['Address of Pothole']);
//         city = List.generate(
//             event.docs.length, (index) => event.docs[index].data()['City']);
//         desc = List.generate(event.docs.length,
//             (index) => event.docs[index].data()['Description of Pothole']);
//         ph_no = List.generate(
//             event.docs.length, (index) => event.docs[index].data()['Phone No']);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyThemes.creamColor,
//       appBar: AppBar(
//         title: Text("Pothole Details"),
//       ),
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               Row(
//                 children: [
//                   Text("Address of Pothole: "),
//                   Text(
//                     "$add[index]",
//                     // snapshot.data.docs[index].data()["chatRoomID"]
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text("City: "),
//                   Text(
//                     "$city[index]",
//                     // snapshot.data.docs[index].data()["chatRoomID"]
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text("Description of Pothole: "),
//                   Text(
//                     "$desc[index]",
//                     // snapshot.data.docs[index].data()["chatRoomID"]
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text("Phone No: "),
//                   Text(
//                     "$ph_no[index]",
//                     //  snapshot.data.docs[index].data()["chatRoomID"]
//                   )
//                 ],
//               ),
//             ],
//           );
//         },
//         itemCount: add.length,
//       ),
//     );
//   }
// }
