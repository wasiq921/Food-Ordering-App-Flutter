import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tandooray/auth.dart';
import 'package:tandooray/home.dart';


class Register extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Register> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String mobilenumber = '';
  String password = '';
  String confirmpassword = '';
  String error = '';

  UserCredential userCredential;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  /*Future sendData() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
      );
      FirebaseFirestore.instance.collection('userData').doc(userCredential.user.uid).set({
        'User id': userCredential.user.uid,
        'Name': nameController.text.trim(),
        'Email': emailController.text.trim(),
        'Mobile Number': mobilenumberController.text.trim(),
        'Password': passwordController.text.trim(),
        'Confirm Password': confirmpasswordController.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        globalKey.currentState.showSnackBar(SnackBar(content: Text("The password provided is too weak."),),);

      } else if (e.code == 'email-already-in-use') {
        globalKey.currentState.showSnackBar(SnackBar(content: Text("The account already exists for that email."),),);
      }
    } catch (e) {
      globalKey.currentState.showSnackBar(SnackBar(content: Text(e),),);
    }


    }
*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('REGISTER'),
          backgroundColor: Colors.red,
          centerTitle:true,

        ),
        body: Padding(
            padding: EdgeInsets.only(top: 130.0, left: 50.0, right: 50.0),
            child: Form(
              key: _formkey,

            child: ListView(
              children: <Widget>[
                TextFormField(
                  onChanged: (val){
                    setState(() => name = val);
                  },
                  controller: nameController,
                  validator: (val) => val.isEmpty ? 'Enter Name' : null,
                  decoration: InputDecoration(
                      hintText: 'Name',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)
                      )
                  ),
                ),
                SizedBox(height: 20.0,),

                TextFormField(
                  onChanged: (val){
                    setState(() => email = val);
                  },
                  controller: emailController,
                  validator: (val) => val.isEmpty ? 'Enter Email' : null,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)
                      )
                  ),
                ),
                SizedBox(height: 20.0,),

                TextFormField(
                  onChanged: (val){
                  setState(() => mobilenumber = val);
                },
                  controller: mobilenumberController,
                  validator: (val) => val.isEmpty ? 'Enter Number' : null,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: 'Mobile Number',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)
                      )
                  ),
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  onChanged: (val){
                    setState(() => password = val);
                  },
                  controller: passwordController,
                  validator: (val) => val.length < 6 ? 'Password should be more than 6 Characters' : null,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)
                      )
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (val){
                    setState(() => confirmpassword = val);
                  },
                  controller: confirmpasswordController,
                  validator: (val) => confirmpassword != password ? "Password Doesn't Match" : null,
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)
                      )
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 40.0),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(5.0),
                    shadowColor: Colors.redAccent,
                    color: Colors.red,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () async {
                        if(_formkey.currentState.validate()){
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() {
                            error = 'Please supply a valid Email Address';
                          });
                        }else{
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>Home()));
                        }
                        }
                      },
                      child: Center(
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'
                          ),
                        ),
                      ),
                    ),

                  ),
                ),

                SizedBox(height: 2.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                )

              ]
            ),
            )));
  }

}