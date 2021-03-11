import 'package:flutter/material.dart';
import 'package:nutritionapp/services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
          title: Text('Registration',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.grey[850],
          actions: [
            FlatButton.icon(onPressed: () {widget.toggleView();}, icon: Icon(Icons.account_circle_outlined,color: Colors.white), label: Text('Sign in',style:TextStyle(color: Colors.white)))
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
                      decoration: InputDecoration(hintText: 'Enter new Email',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      validator: (val) => val.length < 6 ? 'Enter a Password 6+ characters long' : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                      decoration: InputDecoration(hintText: 'Enter new Password',
                          focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                    ),
            ),
                    ),
                    SizedBox(height: 20,),
                    RaisedButton(
                        color: Colors.black,
                        child: Text(
                          'Registration',
                          style:TextStyle(color: Colors.white),
                        ),
                        onPressed: () async{
                          if(_formKey.currentState.validate()){
                            dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                            if(result == null){
                              setState(() {
                                error = 'Registration did not work';
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
    );;
  }
}
