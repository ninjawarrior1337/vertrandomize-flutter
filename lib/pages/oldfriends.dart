import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class landingPage extends StatefulWidget {
  const landingPage({ Key key }) : super(key: key);

  @override
  _landingPage createState() => new _landingPage();
}

class _landingPage extends State<landingPage>
{
  List<String> people = new List();
  Color cbc = Colors.blue;

  String finalVal = "Press Button Below";

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
    return new Random.secure().nextInt(getNextInt());
  }

  void _pressCode() async {
    people.clear();
    people.add("Derek");
    people.add("Jenna");
    people.add("Antonio");
    people.add("Steven");
    people.add("Tia");
    people.add("Dylan");
    people.add("Ethan");
    people.add("Marley");
    people.add("Tyler In VR");
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {

      finalVal = '${people[getRand()]}, ${people[getRand()]}';
      prefs.setString("oldfriendsval", finalVal);
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