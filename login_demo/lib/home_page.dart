import 'package:flutter/material.dart';
import 'package:login_demo/auth.dart';

class HomePage extends StatelessWidget {
HomePage({this.auth,this.onSignedOut});
final BaseAuth auth;
final VoidCallback onSignedOut;

void _signOut() async{
  try{
    await auth.signOut();
    onSignedOut();

  }catch(e){
 print(e);
  }
}

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar : new AppBar (title: new Text('Cap App '),
      actions: <Widget>[
        new FlatButton(onPressed: _signOut, 
        child: new Text('Logout', style : new TextStyle(fontSize:16.0 , color : Colors.redAccent )))
      ],
      ),
      body: new Container(
        child : new Center(child: new Text('Lougout ! ', style : new TextStyle(fontSize:32.0)) ,)
      ),
    );
  }
}