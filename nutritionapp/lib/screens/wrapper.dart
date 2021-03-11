import 'package:flutter/material.dart';
import 'package:nutritionapp/models/user.dart';
import 'package:nutritionapp/screens/authenticate/authenticate.dart';
import 'package:nutritionapp/screens/home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user == null ?  Authenticate() : Home();
  }
}
