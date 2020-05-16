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
     
          print('Signed in : ${userID}');
      } else{
        String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
     
         print('Registred User : ${userId}');
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
   
    return new Scaffold(
      appBar : new AppBar(title: 
      new Text('Flutter login'),
      ),
      body: new Container(
        padding: EdgeInsets.all(15.0),
        child : new Form(
          key : formKey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs()+buildButtons() ,
            )
            ,)
        
        ),
    );
  }
  List<Widget> buildInputs(){
    return [
           new TextFormField(
            decoration : new InputDecoration (labelText: 'Email'),
           validator: (value) => value.isEmpty ? 'Email can\'t be empty': null,
   
            onSaved: (value) => _email = value,

          ),
          new TextFormField(
            decoration : new InputDecoration (labelText: 'Password'),
            obscureText: true,
             validator: (value) => value.isEmpty ? 'Password can\'t be empty': null,
             onSaved: (value) => _password = value,
          ),
    ];
  }

  List<Widget> buildButtons(){
    if(_formType == FormType.login){

    
return[
   new RaisedButton(
            child : new Text('Login',style : new TextStyle(fontSize: 21.0)),
            onPressed: validateAndSubmit,
          ),
          new FlatButton(
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