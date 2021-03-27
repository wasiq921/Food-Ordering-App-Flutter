import'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tandooray/authenticate.dart';
import 'package:tandooray/home.dart';
import 'package:tandooray/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user  = Provider.of<Userr>(context);

    
    // return either Home or Authenticate Widget
    if(user == null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}

