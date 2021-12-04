// import 'package:cloud_firestore/cloud_firestore.dart';

// class DatabaseManager {
//   final CollectionReference profileList =
//       FirebaseFirestore.instance.collection('Pothole Details');

//   Future<void> createUserData(
//       String address, String city, String desc, String uid, int ph_no) async {
//     return await profileList.doc(uid).set({
//       'Address of Pothole': address,
//       'City': city,
//       'Description of Pothole': desc,
//       'Phone No': ph_no
//     });
//   }

//   Future updateUserList(
//       String address, String city, String desc, String uid, int ph_no) async {
//     return await profileList.doc(uid).update({
//       'Address of Pothole': address,
//       'City': city,
//       'Description of Pothole': desc,
//       'Phone No': ph_no,
//     });
//   }

//   Future getDetailsList() async {
//     List itemsList = [];

//     try {
//       await profileList.get().then((querySnapshot) {
//         querySnapshot.docs.forEach((element) {
//           itemsList.add(element.data);
//         });
//       });
//       return itemsList;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }
