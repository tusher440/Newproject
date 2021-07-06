import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class alldata extends StatefulWidget {
  @override
  _alldataState createState() => _alldataState();
}

class _alldataState extends State<alldata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("All Data"),
      ),
      body: StreamBuilder(
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
    );
  }
}
