import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queue/models/Menus.dart';
import 'package:queue/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference favMenu = Firestore.instance.collection('favMenu');

  Future updateUserData(String name, String type, int price) async {
    return await favMenu.document(uid).setData({
      'name': name,
      'type': type,
      'price': price,
    });
  }

  // menu list from snapshot
  List<Menus> _pastMenuFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Menus(
        uid: uid,
        name: doc.data['name'] ?? '',
        type: doc.data['type'] ?? '',
        price: doc.data['price'] ?? 0,
      );
    }).toList();
  }

  Menus _menusFromSnapshot(QuerySnapshot snapshot){

  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      type: snapshot.data['type'],
      price: snapshot.data['price'],
    );
  }

  // get brews stream
  Stream<List<Menus>> get menus {
    return favMenu.snapshots()
        .map(_pastMenuFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return favMenu.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }
}
