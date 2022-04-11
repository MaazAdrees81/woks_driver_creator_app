import 'package:flutter/material.dart';

import 'Widget/bezierContainer.dart';

class RegisterComplete extends StatelessWidget {
  const RegisterComplete({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Theme(
        data: ThemeData(primaryColor: Theme.of(context).accentColor, buttonColor: Theme.of(context).accentColor, canvasColor: Theme.of(context).primaryColor),
        child: Container(
          height: height,
          child: Stack(children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            SafeArea(
              child: Container(
                width: double.infinity, //To make it use as much space as it wants
                height: MediaQuery.of(context).size.height,
                child: Column(children: <Widget>[
                  ListTile(
                    title: Text('Registration Complete', style: Theme.of(context).textTheme.headline4),
                  ),
                  Spacer(),
                  Text('Registration was successful'),
                  ElevatedButton(onPressed: () => Navigator.of(context).pushReplacementNamed('/SignUp'), child: Text('Register Another')),
                  Spacer(),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
