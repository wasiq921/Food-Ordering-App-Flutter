import 'package:firebase_auth/firebase_auth.dart';
import 'package:tandooray/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create User object on FirebaseUser (now User)
  Userr _userFromFirebaseUser(User user){
    return user != null  ?  Userr(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Userr> get user{
    return _auth.authStateChanges()
        //.map((User user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
  }

  
  //sign in anon
  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;

    }
  }


  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;

    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;

    }
  }

  
  //signout
  Future signOut() async {
    try{
      return await _auth.signOut();
  } catch(e) {
      print(e.toString());
      return null;
    }

}

}

