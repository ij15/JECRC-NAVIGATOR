//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jecrc_navigator/alt.dart';
class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  @override
  Widget build(BuildContext context) {
    return

      Drawer(
      child: ListView(
       // prototypeItem: AppBar(title: const Text('JECRC NAVIGATOR'),backgroundColor: Colors.blue,),

        children: [
          const SizedBox(
            height: 50,
          ),
          AppBar(title: const Text('Blocks'),backgroundColor: Colors.blue,),


          ListTile(
            leading: const Icon(Icons.school) ,
            title: const Text("A_BLOCK"),
            onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const alt(),
                    ));

  }
          ),
          ListTile(
            leading: const Icon(Icons.school) ,
            title: const Text("B_BLOCK"),
            onTap: () {}//print("k"),
    ),
    ListTile(
    leading: const Icon(Icons.school) ,
    title: const Text("C_BLOCK"),
    onTap: ()=>{}//print("k"),
    ),
    ListTile(
    leading: const Icon(Icons.school) ,
    title: const Text("D_BLOCK"),
    onTap: ()=>{}//print("k"),
    ),
    ListTile(
    leading: const Icon(Icons.school) ,
    title: const Text("E_BLOCK"),
    onTap: ()=>{}//print("k"),
    )

    ],

    ),

    );
    }
  }

