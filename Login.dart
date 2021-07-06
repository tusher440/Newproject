import 'package:flutter/material.dart';
import 'package:flutter_firebasenewproject/Homepage.dart';
import 'package:flutter_firebasenewproject/Login.dart.';
import 'package:flutter_firebasenewproject/Registration.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email;
  String _password;

 Future<void>login() async {
   final formState = _formkey.currentState;
   if(formState.validate()){
     formState.save();
     FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
     Navigator.push(context, MaterialPageRoute(builder: (context) => homepage()));

   }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Center(child: Text("Login page")),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: "Enter a email",
                labelText: "Email",
              ),
              onSaved: (input){
                setState(() {
                  _email = input;
                });
              },
              validator: (input){
                if(input.isEmpty){
                  return "Please type an email";
                }
                return null;
              },
            ),

            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.vpn_key_rounded),
                hintText: "Enter a password",
                labelText: "Password",
              ),
              onSaved: (input){
                setState(() {
                  _password = input;
                });
              },
              validator: (input){
                if(input.length<4){
                  return "Password is too short";
                }
                return null;
              },
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(top: 5,),
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => homepage()));
                  });
                },
                child: Text("Login",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),

            Padding
              (
              padding: const EdgeInsets.only(top: 5,),
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => registration(),
                    )
                    );

                  });
                },
                child: Text("Register",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
