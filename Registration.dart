import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebasenewproject/Homepage.dart';
import 'package:flutter_firebasenewproject/Login.dart';

class registration extends StatefulWidget {
  @override
  _registrationState createState() => _registrationState();
}

class _registrationState  extends State<registration> {
  final GlobalKey<FormState> _rformkey = GlobalKey<FormState>();
  String _remail;
  String _rpassword;

  Future<void>signIn() async{
    final formState = _rformkey.currentState;
    if(formState.validate()){
      formState.save();
      FirebaseUser newuser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _remail, password: _rpassword);
      Navigator.push(context, MaterialPageRoute(builder: (context) => loginpage(),
      ),
    );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Registration")),
      ),
      body: Form(
        key: _rformkey,
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
                  _remail = input;
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
                  _rpassword = input;
                });
              },
              validator: (input){
                if(input.length<6){
                  return "Password is too short";
                }
                return null;
              },
            ),

            Padding
            (
            padding: const EdgeInsets.only(top: 5,),
             child: FlatButton(
                onPressed: (){
                  setState(() {
                  signIn();
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
