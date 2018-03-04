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
  List<String> people = new List(9);
  String finalVal = "Press Button Below";
  Color cbc = Colors.blue;

  bool tylerSwitch = false;

  int getNextInt()
  {
    if (tylerSwitch)
      return 9;
    else
      return 8;
  }

  int getRand()
  {
    return new Random.secure().nextInt(getNextInt());
  }

  void _pressCode(){
    people[0] = ("Derek");
    people[1] = ("Jenna");
    people[2] = ("Antonio");
    people[3] = ("Steven");
    people[4] = ("Tia");
    people[5] = ("Dylan");
    people[6] = ("Ethan");
    people[7] = ("Marley");
    people[8] = ("Tyler In VR");

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
                    setState(() {
                      tylerSwitch = value;
                    }
                    );
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