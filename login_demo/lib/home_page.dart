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
      appBar : new AppBar (title: new Text('Cap App '),
      actions: <Widget>[
        new FlatButton(onPressed: (){
            auth.signOut();
    navigateToSubPage(context);
  
        }, 
        child: new Text('Logout', style : new TextStyle(fontSize:16.0 , color : Colors.redAccent )))
      ],
      ),
      body: new Container(
        child : new Center(child: new Text('Lougout ! ', style : new TextStyle(fontSize:32.0)) ,)
      ),
    );
  }
}