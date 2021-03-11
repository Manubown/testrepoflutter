import 'package:flutter/material.dart';
import 'package:nutritionapp/models/user.dart';
import 'package:nutritionapp/screens/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutritionapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  AuthService _auth = AuthService();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: _auth.user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
