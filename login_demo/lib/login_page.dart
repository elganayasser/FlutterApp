import 'package:flutter/material.dart';

import 'auth.dart';

class LoginPage extends StatefulWidget{
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}
enum FormType{
login,
registre
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState> ();
String _email;
String _password;
FormType _formType = FormType.login;


    bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
     form.save();
 
     return true;
    }else{
    return false;
   }
   }
   void validateAndSubmit() async{
  
     if(validateAndSave()){
       try{ 
         
        if(_formType==FormType.login){
          String userID = await widget.auth.signInWithEmailAndPassword(_email, _password);
     
         // print('Signed in : ${userID}');
      } else{
        String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
     
        // print('Registred User : ${userId}');
 }
         widget.onSignedIn();
 
     } catch(e){
       print('Error $e');
      }
 
     }
  }

    void moveToregistre(){
     formKey.currentState.reset();
     setState(() {
      _formType = FormType.registre;
     });
    }

    void moveToLogin(){
     setState(() {
     _formType = FormType.login;
    });
   }

@override
  Widget build(BuildContext context) {
   
    return  SafeArea(
      
      child: Scaffold(
      
  
       backgroundColor: Color(0xff0D192A),
      body: new Container(
        child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
              child: Container(
                
                width: 120,
                height: 120,
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            
               
            ),
              ),
               Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(40.0),

             child : new Form(key : formKey,  child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs()+buildButtons() ,
            ))
             ),
              
        ],
        
        
        
    ),
    ) ,
      ),
    );
  }
  List<Widget> buildInputs(){
    return [
           new TextFormField(
             style: TextStyle(color: Colors.black),
            decoration : new InputDecoration (labelText: 'Email', fillColor: Colors.white, filled: true, hintText: "Enter Your Email",
                          hintStyle: TextStyle(color: Colors.grey[400]), border: InputBorder.none ),
           validator: (value) => value.isEmpty ? 'Email can\'t be empty': null,
   
            onSaved: (value) => _email = value,

          ),
          SizedBox(height: 20.0),
          new TextFormField(
             
            style: TextStyle(color: Colors.black),
            decoration : new InputDecoration (labelText: 'Password', fillColor: Colors.white, filled: true, hintText: "Enter Your Email",
                          hintStyle: TextStyle(color: Colors.grey[400]), border: InputBorder.none ),
            obscureText: true,
             validator: (value) => value.isEmpty ? 'Password can\'t be empty': null,
             onSaved: (value) => _password = value,
          ),
    ];
  }

  List<Widget> buildButtons(){
     
    if(_formType == FormType.login){

    
return[
   SizedBox(height: 20.0),
   new FlatButton(
      
            child : new Text('Login',style : new TextStyle(fontSize: 21.0)),
            onPressed: validateAndSubmit,
            padding: EdgeInsets.all(10.0),
              color: Colors.blue,
              textColor: Colors.white
          ),
          new RaisedButton(
            child: new Text('Create an Account' , style: new TextStyle(fontSize : 21.0)),
            onPressed: moveToregistre,
            
            )
];
} else{
  
  return[
   new RaisedButton(
            child : new Text('Create an account ',style : new TextStyle(fontSize: 21.0)),
            onPressed: validateAndSubmit,
          ),
          new FlatButton(
            child: new Text('Already have an account ? login' , style: new TextStyle(fontSize : 21.0)),
            onPressed: moveToLogin,
            )
];
}
  }

}