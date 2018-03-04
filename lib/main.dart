import 'package:flutter/material.dart';

import 'package:vertrandomize_flutter/pages/newfriends.dart' as nfri;
import 'package:vertrandomize_flutter/pages/oldfriends.dart' as ofri;

void main()
{
  runApp(new MaterialApp(
    home: new MyTabs()
  ));
}

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {


  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Vert Randomize 2"),
            backgroundColor: Colors.blue,
            bottom: new TabBar(
                controller: controller,
                tabs: <Tab>[
                  new Tab(text: "New Friends",),
                  new Tab(text: "Old Friends",),
                ]
            )
        ),
        body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new nfri.landingPage(),
              new ofri.landingPage()
            ]
        )
    );
  }
}


