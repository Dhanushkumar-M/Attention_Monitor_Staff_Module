import 'package:firebase_database/firebase_database.dart';

class Dbdata {
  String crtuser;
  Dbdata(this.crtuser);
  Dbdata.map(dynamic obj) {
    this.crtuser = obj['id'];
  }
  String get id => crtuser;
  Dbdata.fromSnapshot(DataSnapshot snapshot) {
    crtuser = snapshot.key;
  }
}
