import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter/services.dart';

class landingPage extends StatefulWidget {
  const landingPage({ Key key }) : super(key: key);

  @override
  _landingPage createState() => new _landingPage();
}

class _landingPage extends State<landingPage>
{
  List<String> people = new List();
  String finalVal = "Press Button Below";
  Color cbc = Colors.blue;

  bool tylerSwitch = false;

  int getNextInt()
  {
    if (tylerSwitch)
      return people.length;
    else
      return people.length - 1;
  }

  int getRand()
  {
    return Random().nextInt(getNextInt());
  }

  void _pressCode(){
    people.clear();
    people.add("Darren");
    people.add("Jenna");
    people.add("Bryan");
    people.add("Jaxon");
    people.add("Brandon");
    people.add("Jesus");
    people.add("Johnny");
    people.add("Robert");
    people.add("Shiraz");
    people.add("Aidan");
    people.add("Allen");
    people.add("Tyler");

    setState((){
      int p1 = getRand();
      int p2 = getRand();
      finalVal = '${people[p1]}, ${people[p2]}';
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
    return new Container(
      child: new Scaffold(
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Center(
              child: new SwitchListTile(
                  value: tylerSwitch,
                  onChanged: (bool value) {
                    SystemSound.play(SystemSoundType.click);
                    setState(()
                      {
                        tylerSwitch = value;
                      }
                    );
                    print(tylerSwitch);
                    },
                  title: new Text("Tyler Mode"),
              ),

            ),
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
                onPressed: (){
                  _pressCode();
                  SystemSound.play(SystemSoundType.click);
                },
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