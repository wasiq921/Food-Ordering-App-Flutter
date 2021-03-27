import 'package:firebase_database/firebase_database.dart';

class User {

  String _id;
  String _foodName;
  String _price;


  User(this._id,this._foodName, this._price);

  String get foodName => _foodName;

  String get price => _price;



  String get id => _id;

  User.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _foodName = snapshot.value['foodName'];
    _price = snapshot.value['price'];


  }

}
