import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:provider/provider.dart';
import 'model/app_state_model.dart'; 
import 'auth.dart';
import 'home_page.dart';
import 'root_page.dart';
void main(){
 return runApp(
   
   ChangeNotifierProvider<AppStateModel>(           
     builder: (context) => AppStateModel()..loadProducts(), 
     child: MyApp(),                   
   ),
 );
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   
    return new MaterialApp(
      title : 'Flutter cupertino',
      theme : new ThemeData(
      primarySwatch: Colors.blue,
      ),
      
      home : new RootPage(auth : new Auth())
    );
  }
}