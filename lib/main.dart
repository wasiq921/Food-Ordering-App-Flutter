import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:tandooray/auth.dart';
import 'package:tandooray/google_sign_in.dart';
import 'package:tandooray/home.dart';
import 'package:tandooray/my_provider.dart';
import 'package:tandooray/sign_in.dart';
import 'package:tandooray/user.dart';
import 'wrapper.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MyProvider()),
    StreamProvider<Userr>.value(
    value: AuthService().user
    ),
          ChangeNotifierProvider(create: (context) => GoogleSignInProvider(),
            child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                final provider = Provider.of<GoogleSignInProvider>(context);
                if (snapshot.hasData) {
                  return Home();
                } else {
                  return SignIn();
                }
              },
            ),
          )],
    child: MaterialApp(
    home: Wrapper(),
    )
    );
    return StreamProvider<Userr>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
