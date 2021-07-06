import 'package:flutter/material.dart';
import 'package:flutter_firebasenewproject/Alldata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebasenewproject/Login.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String name;
  String mobile;
  String address;

   Firestore firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
                boxShadow: [
                  BoxShadow(color: Colors.green, spreadRadius: 3),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 10,),
                child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle_rounded),
                      hintText: "Name",
                    ),
                    onChanged: (input){
                      setState(() {
                        name = input;
                      });

                    }
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
                boxShadow: [
                  BoxShadow(color: Colors.green, spreadRadius: 3),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 10,),
                child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.phone_android),
                      hintText: "Mobile",
                    ),
                    onChanged: (input){
                      setState(() {
                        mobile = input;
                      });

                    }
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
                boxShadow: [
                  BoxShadow(color: Colors.green, spreadRadius: 3),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 10,),
                child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_on),
                      hintText: "Address",
                    ),
                    onChanged: (input){
                      setState(() {
                        address = input;
                      });

                    }
                ),
              ),
            ),
          ),

          FlatButton(
            onPressed: (){
              setState(() {
                Firestore.instance.collection("Demo").add({
                  "Name": name,
                  "Mobile": mobile,
                  "Address": address,

                });
              });
            },
            child: Text("Send Data"),
            color: Colors.blueAccent,
            splashColor: Colors.blueAccent,
          ),

          // FlatButton(
          //   onPressed: (){
          //     setState(() {
          //       Navigator.push(context, MaterialPageRoute(builder: (context) => alldata(),
          //       )
          //       );
          //     });
          //   },
          //   child: Text("Get Data"),
          //   color: Colors.blueAccent,
          //   splashColor: Colors.blueAccent,
          // ),

          FlatButton(
            onPressed: (){
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Text("Logout"),
            color: Colors.blueAccent,
            splashColor: Colors.blueAccent,
          ),
          Expanded(
              child:
                    StreamBuilder(
                    stream: Firestore.instance.collection("Demo").snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(!snapshot.hasData){
                    return Text("No value");
                    }
                    return ListView(
                    children: snapshot.data.documents.map((document){
                    return Column(
                    children: <Widget>[
                    Text(document ['Name']??  ' '),
                    Text(document ['Mobile']??  ' '),
                    Text(document ['Address']??  ' '),
                    ],
                    );
                    }).toList(),
                    );
                    }
                    )
          ),
        ],
      ),
    );
  }
}
