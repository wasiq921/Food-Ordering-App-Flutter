import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tandooray/auth.dart';
import 'package:tandooray/google_sign_in.dart';
import 'home.dart';
import 'register.dart';
import 'add_address.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;



class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn>{



  bool _isloggedIn = false;
  Map user;

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  final facebookLogin = FacebookLogin();

  _loginwithfb() async {
    final result = await facebookLogin.logIn(['email']);
    switch( result.status){
      case FacebookLoginStatus.loggedIn:
        final token =result.accessToken.token;
        final graphResponse =await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          user =profile;
          _isloggedIn =true;
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>Home()));
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() {
          _isloggedIn = false;
        }
        );
        break;
      case FacebookLoginStatus.error:
        setState(() {
          _isloggedIn = false;
        });


    }

  }



  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<GoogleSignInProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
        backgroundColor: Colors.red,
        centerTitle:true,

        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Icon(Icons.person_add),
                SizedBox(width: 10.0)

              ],
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Register()));
            },
          )
        ],
      ),
      resizeToAvoidBottomPadding:false,
      body: Column(

        children: <Widget>[
          Container(
            child: Center(
              child: Image.asset('assets/logo.png',
                height: 250.0,
                width: 350.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 0.0, left: 50.0, right: 50.0),
            child: Form(
              key: _formkey,
               child: Column(
              children: <Widget>[
                TextFormField(
                  onChanged: (val){
                    setState(() => email = val);
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) => val.isEmpty ? 'Enter Email' : null,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)
                      )
                  ),
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  onChanged: (val) {
                    setState(() => password = val);
                  },
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
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(5.0),
                    shadowColor: Colors.redAccent,
                    color: Colors.red,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () async {
                        if(_formkey.currentState.validate()) {
                          dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {

                              error = "COULDN'T LOGIN WITH THOSE CREDENTIALS";
                              
                            });
                          }
                        }
                      },
                      child: Center(
                        child: Text(
                          'LOGIN',
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
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: (){
                    _loginwithfb();
                  },
                  child: Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: ImageIcon(AssetImage('assets/fb_icon.png')),
                          ),
                          SizedBox(width: 10.0),
                          Center(
                              child: Text('Sign In with Facebook ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'
                                ),
                              )
                          )
                        ],
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: ()  {
                    final provider= Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.login();

                  },
                  child: Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: FaIcon(FontAwesomeIcons.google, color: Colors.black),
                          ),
                          SizedBox(width: 10.0),
                          Center(
                              child: Text('Sign In with Google',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.only(top: 10.0, left: 20.0),
                  child: InkWell(
                    child: Text('Forgot Password',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'
                      ),
                    ),
                  ),
                ),
                /*SizedBox(height: 5.0),
                FlatButton(
                  child: Text('SKIP',


                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Address()));
                  },
                ),*/

              ],
            ),
            ),
          ),
        ],
      ),
    
    );
  }
}
