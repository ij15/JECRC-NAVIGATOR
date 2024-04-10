//import 'dart:async';
import 'package:flutter/material.dart';
class alt extends StatefulWidget {
  const alt({super.key});

  @override
  State<alt> createState() => _altState();
}

class _altState extends State<alt> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:  ListView(
        scrollDirection: Axis.vertical,
          children:  [
            SizedBox(
              height: 11,
            ),
         AppBar(title: const Text('JECRC NAVIGATOR'),backgroundColor: Colors.blue,),


         ListTile(
            leading: Text("Lt1",),
            title: Text("Lecture theatre 1",style: TextStyle(fontWeight: FontWeight.bold),),

            subtitle: Text("Ground floor",style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
            trailing:Icon(Icons.add ),
          ),

           ListTile(
            leading: Text("Lt2"),
            title: Text("Lecture theatre 2",style: TextStyle(fontWeight: FontWeight.bold),),

            subtitle: Text("Ground floor",style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
            trailing:  Icon(Icons.add),
          ),
          ListTile(
            leading: Text("Lt3"),
            title: Text("Lecture theatre 3",style: TextStyle(fontWeight: FontWeight.bold),),

            subtitle: Text("First floor",style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
            trailing: Icon(Icons.add),
          ),
         ListTile(
            leading: Text("Lt4"),
            title: Text("Lecture theatre 4",style: TextStyle(fontWeight: FontWeight.bold),),

            subtitle: Text("First floor",style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
            trailing: Icon(Icons.add),
          ),
           ListTile(
            leading: Text("IBM",),
            title: Text("IBM LAB",style: TextStyle(fontWeight: FontWeight.bold),),

            subtitle: Text("First floor",style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
            trailing: Icon(Icons.add),
          ),ListTile(
            leading: Text("LIB"),
            title: Text("CENTRAL LIBRARY",style: TextStyle(fontWeight: FontWeight.bold),),

            subtitle: Text("Ground floor",style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
            trailing: Icon(Icons.add),
          ),
         ListTile(
              leading: Text("AS"),
              title: Text("Accounts office",style: TextStyle(fontWeight: FontWeight.bold),),

              subtitle: Text("Ground floor",style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
              trailing: Icon(Icons.add),
         ),
          ListTile(
            leading: Text("CP1"),
            title: Text("Computer programming lab 1",style: TextStyle(fontWeight: FontWeight.bold),),

            subtitle: Text("Ground floor",style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Text("CP2"),
            title: Text("Computer programming lab 2",style: TextStyle(fontWeight: FontWeight.bold),),

            subtitle: Text("Ground floor",style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Text("CP3"),
            title: Text("Computer programming lab 3",style: TextStyle(fontWeight: FontWeight.bold),),

            subtitle: Text("first floor",style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
            trailing: Icon(Icons.add),
          ), ListTile(
            leading: Text("CP4"),
            title: Text("Computer programming lab 4",style: TextStyle(fontWeight: FontWeight.bold),),

            subtitle: Text("first floor",style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
            trailing: Icon(Icons.add),
          ),



        ],

      ),

    );
    
  
   

    
  }
}
