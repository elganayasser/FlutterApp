import 'package:flutter/material.dart';
import 'package:login_demo/auth.dart';
import 'package:login_demo/login_page.dart';

class HomePage extends StatelessWidget {
HomePage({this.auth,this.onSignedOut});
final BaseAuth auth;
final VoidCallback onSignedOut;
Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
}



  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar : new AppBar (title: new Text('Cupertino Store'),backgroundColor:Colors.redAccent,
      actions: <Widget>[
        new RaisedButton(textColor: Colors.white,
              color: Colors.redAccent,
              child: Text('Logout'),
              onPressed: () {
               
                 auth.signOut();
    navigateToSubPage(context);
              },
       ),
      ],
      ),
    body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Click button to Logout'),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.redAccent,
              child: Text('Logout'),
              onPressed: () {
             
                 auth.signOut();
    navigateToSubPage(context);
              },
            )
          ],
        ),
      ),
    );
  }
}