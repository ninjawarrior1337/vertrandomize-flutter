import 'package:flutter/material.dart';
import 'dart:math';

class landingPage extends StatefulWidget {
  const landingPage({ Key key }) : super(key: key);

  @override
  _landingPage createState() => new _landingPage();
}

class _landingPage extends State<landingPage>
{
  List<String> people = new List(10);
  String finalVal = "Press Button Below";
  Color cbc = Colors.blue;

  int getRand()
  {
    return new Random().nextInt(people.length);
  }

  void _pressCode(){
    people[0] = ("Darren");
    people[1] = ("Jenna");
    people[2] = ("Bryan");
    people[3] = ("Jaxon");
    people[4] = ("Tyler");
    people[5] = ("Jesus");
    people[6] = ("Johnny");
    people[7] = ("Robert");
    people[8] = ("Shiraz");
    people[9] = ("Brandon");

    setState((){
      finalVal = '${people[getRand()]}, ${people[getRand()]}';
      if (cbc == Colors.blue)
      {
        cbc = Colors.greenAccent;
      }
        else
      {
        cbc = Colors.blue;
      }
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return new Material(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Vert Randomize 2"),
          backgroundColor: Colors.blue,
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Center(
              child: new Text(
                  finalVal,
                style: new TextStyle(
                  fontSize: 40.0,

                ),
              ),
            ),
            new Center(
              child: new RaisedButton(
                onPressed: _pressCode,
                color: cbc,
                child: new Text("Generate Pair")
              ),
            )
          ],
        ),
      ),
    );
  }
}