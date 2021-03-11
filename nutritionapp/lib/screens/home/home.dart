import 'package:flutter/material.dart';
import 'package:nutritionapp/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 5,),
              BarWidget(),
              SizedBox(height: 10,),
              SwitchBar(),
              SizedBox(height: 5,),
              TimeUse(),
              SizedBox( width: 180, height: 40,
                child: RaisedButton.icon(
                  color: Colors.grey[800],
                    onPressed: () async {
                    await _auth.signOut();
                    },
                    icon: Icon(Icons.logout),
                    label: Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );  }
}



class BarWidget extends StatefulWidget {
  @override
  _BarWidgetState createState() => _BarWidgetState();
}

class _BarWidgetState extends State<BarWidget> {

  int kcal = 1800;
  int verbraucht = 0;
  int gegessen = 0;
  int verbrennt = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 320,
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 35,),
            Text(
              '$kcal',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 50,),
                Text(
                  '$gegessen',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 80,),
                Text(
                  'übrig',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 75,),
                Text(
                  '$verbrennt',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),// Werte
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 25,),
                Text(
                  'gegessen',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 138,),
                Text(
                  'verbrannt',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),// Text zu Werte
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 6,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchBar extends StatefulWidget {
  @override
  _SwitchBarState createState() => _SwitchBarState();
}

class _SwitchBarState extends State<SwitchBar> {

  @override
  void initState() {
    super.initState();
    updateTime();
  }

  var wholedate = new DateTime.now();
  var date;
  bool value = false;

  void updateTime(){
    Future.delayed(Duration(seconds: 60),(){
      setState(() {
        wholedate = new DateTime.now();
      });
      updateTime();
    });
  }

  onSwitchValueChange(bool val){
    setState(() {
      value = val;
    });
  }

  String checkMinutes(int min){
    String re;
    min<10 ? re = '0$min' :  re= '$min';
    return re;
  }

  String checkHour(int h){
    String re;
    h<10 ? re = '0$h' :  re= '$h';
    return re;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${wholedate.day}.${wholedate.month}.${wholedate.year}',
            style: TextStyle(
                fontSize: 20
            ),
          ), // Date
          SizedBox(width: 40,),
          Switch(
            value: value,
            onChanged: (val){onSwitchValueChange(val);},
            activeColor: Colors.black,
            inactiveThumbColor: Colors.black,
          ),
          SizedBox(width: 50,),
          Text(
            '${checkHour(wholedate.hour)}:${checkMinutes(wholedate.minute)}',
            style: TextStyle(
                fontSize: 20
            ),
          ),// Time
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),

    );
  }
}

class TimeUse extends StatefulWidget {
  @override
  _TimeUseState createState() => _TimeUseState();
}

class _TimeUseState extends State<TimeUse> {

  List<Widget> notes = [];

  Widget CreateNote(){
    return SizedBox(
      height: 80,
      child: Container(
        color: Colors.grey[800],
        margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
        child: Text('Test'),
      ),
    );
  }

  void AddNote(){
    notes.add(CreateNote());
  }

  @override
  void initState() {
    super.initState();
    AddNote();
    AddNote();
    AddNote();
    AddNote();
    AddNote();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView(
          children: notes
      ),
    );
  }
}
