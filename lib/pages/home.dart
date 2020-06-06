import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    // set background
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    Color textColor = data['isDayTime'] ? Colors.indigo[700] : Colors.white;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(
          children: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, "/location");
                  print(result);
                  if (result != null) {
                    setState(() {
                      data = {
                        "time": result["time"],
                        "location": result["location"],
                        "isDayTime": result["isDayTime"],
                        "flag": result["flag"],
                      };
                    });
                  }
                },
                icon: Icon(
                  Icons.edit_location,
                  color: textColor,
                ),
                label: Text(
                  "Edit Location",
                  style: TextStyle(color: textColor),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data["location"],
                  style: TextStyle(
                      letterSpacing: 2, fontSize: 28, color: textColor),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              data["time"],
              style: TextStyle(fontSize: 66, color: textColor),
            )
          ],
        ),
      )),
    );
  }
}
