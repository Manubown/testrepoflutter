import 'package:flutter/material.dart';
import 'package:nutritionapp/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email ='';
  String password ='';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('Sign in',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey[850],
        actions: [
          FlatButton.icon(onPressed: () {widget.toggleView();}, icon: Icon(Icons.account_circle_outlined,color: Colors.white), label: Text('Registration',style:TextStyle(color: Colors.white)))
        ],
      ),
      body: Container(
        color: Colors.grey[800],
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: Form(
          key: _formKey,
          child:Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
                decoration: InputDecoration(hintText: 'Enter Email',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a Password 6+ characters long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
                decoration: InputDecoration(hintText: 'Enter Password',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(
                color: Colors.black,
                child: Text(
                  'Sign in',
                  style:TextStyle(color: Colors.white),
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = 'Sign in did not work';
                      });
                    }
                  }
                }
              ),
              SizedBox(height: 12,),
              Text(error,
                style: TextStyle(color: Colors.red, fontSize: 16),
              )
            ],
          )
        )
      )
    );
  }
}
