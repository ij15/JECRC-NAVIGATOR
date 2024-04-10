import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'poly_lines.dart';
import 'package:jecrc_navigator/navbar.dart';
import 'alt.dart';
import 'latlng.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  String def= '';
  String def2 ="";
  List l =[
    {"title": "A_block", "value" : "a"},
    {"title": "B_block", "value" : "b"},
    {"title": "C_block", "value" : "c"},
    {"title": "D_block", "value" : "d"},
    {"title": "E_block", "value" : "e"},
    {"title": "Gh_block", "value" : "g"},

  ];
  final Completer<GoogleMapController> _controller= Completer();
 // TextEditingController _searchController = TextEditingController();
  static const CameraPosition _kgoogleplex= CameraPosition(
    target: LatLng( 26.78309,75.82045 ),
    zoom:19.1521679,

  );

   final List<Marker> _marker =[];
   final List<Marker> _list =const [
    Marker(
        markerId: MarkerId('1'),
      position: LatLng(26.78146,75.8209 ),
        infoWindow: InfoWindow(
        title: 'BH1'

    )
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng( 26.78309,75.8204),
        infoWindow: InfoWindow(
            title: 'GH'

        )
    ),

     Marker(
        markerId: MarkerId('3'),
        position: LatLng( 26.78190,75.8219),
        infoWindow: InfoWindow(
            title: 'A block'

        )
    ), Marker(
        markerId: MarkerId('9'),
        position: LatLng(26.78217,8204 ),
        infoWindow: InfoWindow(
            title: 'B block'

        )
    ),
     Marker(
        markerId: MarkerId('5'),
        position: LatLng( 26.78125,75.81927),
        infoWindow: InfoWindow(
            title: 'C Block'

        )
    ),
     Marker(
        markerId: MarkerId('6'),
        position: LatLng( 26.78190,75.81940),
        infoWindow: InfoWindow(
            title: 'D Block'

        )
    ),
     Marker(
        markerId: MarkerId('7'),
        position: LatLng( 26.78170,75.8217),
        infoWindow: InfoWindow(
            title: 'E Block'

        )
    ),
    //  Marker(
    //     markerId: MarkerId('9'),
    //     position: LatLng( 26.783059,75.8204861),
    //     infoWindow: InfoWindow(
    //         title: 'B Block'
    //
    //     )
    // )
  ];
   Future<Position> getUserCurrentLocation() async{
     await Geolocator.requestPermission().then((value){

     }).onError((error, stackTrace) {
       //print("error"+error.toString());
     });

     return await Geolocator.getCurrentPosition();
   }

  @override
  void initState()
  {
    //TODO : imlpement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const navbar(),
      appBar: AppBar(title: const Text('JECRC NAVIGATOR'),backgroundColor: Colors.blue,),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 10,
          ),
          

                     InputDecorator(
                       decoration: InputDecoration(
                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                         contentPadding: const EdgeInsets.all(10),
                       ),
                       child: DropdownButtonHideUnderline(
                         child: DropdownButton<String>(
                           value: def,
                          isDense: true,
                          isExpanded: true,
                    menuMaxHeight: 350,
                           items: [
                            const DropdownMenuItem(
                            value: "",
                            child:Text("Choose start location",)

                           ),
                            ...l.map<DropdownMenuItem<String>>((data)
                             {
                               return DropdownMenuItem(
                                   value: data['value'],
                                   child: Text(data['title']),
                               );
                             }).toList(),
                    ],
                    onChanged: (String? n){
                          setState(() {
                            def=n!;
                            //print(def);
                          });
                    },
                  ),
                       ),
                     ),
          const SizedBox(
            height: 15,
          ),
                     InputDecorator(
                       decoration: InputDecoration(
                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                         contentPadding: const EdgeInsets.all(10),
                       ),
                       child: DropdownButtonHideUnderline(
                         child: DropdownButton<String>(
                           value: def2,
                          isDense: true,
                          isExpanded: true,
                    menuMaxHeight: 350,
                           items: [
                            const DropdownMenuItem(
                            value: "",
                            child:Text("Choose destination location",)

                           ),
                            ...l.map<DropdownMenuItem<String>>((data)
                             {
                               return DropdownMenuItem(
                                   value: data['value'],
                                   child: Text(data['title']),
                               );
                             }).toList(),
                    ],
                    onChanged: (String? n){
                          setState(() {
                            def2=n!;
                            //print(def);
                          });
                    },
                  ),
                       ),
                     ),
          ElevatedButton(onPressed: (){

          //start a
            if(def=="a" ) {
              if (def2 == "b") {
                List<LatLng> latlng1 =[
                  const LatLng(26.78192,75.82156),
                  const LatLng(26.78215,75.82156),
                   const LatLng(26.78217,75.82095),
                  const LatLng(26.78192,75.82093 ),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  latlng(latlng1),
                    ));
              }
              else if (def2 == "c") {
                List<LatLng> latlng1 =[
                  const LatLng(26.78192,75.82156),
                  const LatLng(26.78215,75.82156),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78220,75.82030),
                  const LatLng(26.78218,75.82028),
                  const LatLng(26.78165,75.82020),
                  const LatLng(26.78167,75.81985),
                  const LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.819733),
                  const LatLng(26.78167,75.819731),
                  const LatLng( 26.78140,75.81930),

                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }

              else if (def2 == "d") {
                List<LatLng> latlng1 =[
                  const LatLng(26.78192,75.82156),
                  const LatLng(26.78215,75.82156),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78220,75.82030),
                  const LatLng(26.78218,75.82028),
                  //LatLng(26.78165,75.82020),
                  const LatLng(26.78167,75.81985),
                   const LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.819730)
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "e") {
                List<LatLng> latlng1 =[
                  const LatLng(26.78192,75.82156),
                  const LatLng(26.78170,75.82156),


                  //LatLng(26.78309,75.8204),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  latlng(latlng1),
                    ));
              }
              else if (def2 == "g") {
                List<LatLng> latlng1 =[
                  const LatLng(26.78192,75.82156),
                  const LatLng(26.78215,75.82156),
                 // LatLng(26.78217,75.82105),
                 const LatLng(26.78224,75.82055 ),
                  const LatLng(26.78277,75.82058),

                  //LatLng(26.78309,75.8204),
                ];
                Navigator.push(
                    context,

                    MaterialPageRoute(builder: (context) =>   latlng(latlng1),
                    ));
              }
            }
                //start b
                else if(def=="b" )
                {
                  if(def2=="a")
                  {
                    List<LatLng> latlng1=[
                      const LatLng(26.78192,75.82093 ),
                      const LatLng(26.78217,75.82095),
                      const LatLng(26.78215,75.82156),
                      const LatLng(26.78192,75.82156),
                    ];
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => latlng(latlng1),
                        ));

                  }
                  else if(def2=="g")
                  {
                    List<LatLng> latlng1 =[
                      const LatLng(26.78192,75.82095 ),
                      const LatLng(26.78217,75.82093 ),
                      const LatLng(26.78224,75.82055 ),
                     // const LatLng(26.78279,75.82057 ),
                      const LatLng(26.78267,75.82058 ),

                      //LatLng(26.78309,75.8204),
                    ];
                   // print(latlng1);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => latlng(latlng1),
                        ));

                  }
                  else if(def2=="c")
                  {
                    List<LatLng> latlng1=[
                      const LatLng(26.78192,75.82093 ),
                      const LatLng(26.78217,75.82095),
                      const LatLng(26.78222,75.82040),
                      const LatLng(26.78220,75.82030),
                      const LatLng(26.78218,75.82028),
                      const LatLng(26.78165,75.82020),
                      const LatLng(26.78167,75.81985),
                      const LatLng(26.78167,75.81980),
                      const LatLng(26.78167,75.819730),
                      const LatLng(26.78167,75.819731),
                      const LatLng(26.78140,75.81943),
                     // const LatLng( 26.78140,75.81931),
                     // const LatLng( 26.78140,75.81931),

                    ];

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => latlng(latlng1),
                        ));

                  }
                  else if(def2=="d")
                  {
                    List<LatLng> latlng1=[
                      const LatLng(26.78192,75.82093 ),
                      const LatLng(26.78217,75.82095),
                      const LatLng(26.78222,75.82040),
                      const LatLng(26.78220,75.82030),
                      const LatLng(26.78218,75.82028),
                      const LatLng(26.78165,75.82020),
                      const LatLng(26.78167,75.81985),
                      const LatLng(26.78167,75.81980),
                      const LatLng(26.78167,75.819730),

                    ];
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => latlng(latlng1),
                        ));

                  }
                  else if(def2=="e")
                  {
                    List<LatLng> latlng1=[
                      const LatLng(26.78192,75.82093 ),
                      const LatLng(26.78217,75.82095),
                      const LatLng(26.78215,75.82156),
                     // const LatLng(26.78192,75.82155),
                      const LatLng(26.78155, 75.82156),
                    ];
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => latlng(latlng1),
                        ));

                  }
             }
                else if(def=="c" ) {
              if (def2 == "b") {
                List<LatLng> latlng1=[
                  const   LatLng( 26.78140,75.81943),
                  const LatLng(26.78167,75.819731),
                  const LatLng(26.78167,75.819730),
                  const LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.81985),
                  const LatLng(26.78165,75.82020),
                  const LatLng(26.78218,75.82028),
                  const LatLng(26.78220,75.82030),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78217,75.82095),
                  const LatLng(26.78192,75.82093 ),
                  

                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "a") {
                List<LatLng> latlng1 =[
                  const LatLng( 26.78140,75.81930),
                  const LatLng(26.78167,75.819731),
                  const LatLng(26.78167,75.819733),
                  const LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.81985),
                  const LatLng(26.78165,75.82020),
                  const LatLng(26.78218,75.82028),
                  const LatLng(26.78220,75.82030),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78215,75.82156),
                  const LatLng(26.78192,75.82156),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "g") {
                List<LatLng> latlng1 =[
                  const LatLng( 26.78140,75.81930),
                  const LatLng(26.78167,75.819731),
                  const LatLng(26.78167,75.819730),
                  const LatLng(26.78167,75.819730),
                  const LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.81985),
                  const LatLng(26.78165,75.82020),
                  const LatLng(26.78218,75.82028),
                  const LatLng(26.78220,75.82030),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78224,75.82055 ),
                  const LatLng(26.78265,75.82058),

                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "d") {
                List<LatLng> latlng1=[
                  const   LatLng( 26.78140,75.81930),
                  const LatLng(26.78167,75.819731),
                  const LatLng(26.78167,75.819730),
                  const LatLng(26.78167,75.81980),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "e") {
                List<LatLng> latlng1 =[
                  const LatLng( 26.78140,75.81930),
                  const LatLng(26.78167,75.819731),
                  const LatLng(26.78167,75.819733),
                  const LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.81985),
                  const LatLng(26.78165,75.82020),
                  const LatLng(26.78218,75.82028),
                  const LatLng(26.78220,75.82030),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78215,75.82156),
                  const LatLng(26.78192,75.82156),
                  const LatLng(26.78170,75.82156),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
            }
                // start d
            else if(def=="d" ) {
             
              if (def2 == "b") {
                List<LatLng> latlng1=[
                  const LatLng(26.78167,75.819730),
                  const LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.81985),
                  const LatLng(26.78165,75.82020),
                  const LatLng(26.78218,75.82028),
                  const LatLng(26.78220,75.82030),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78217,75.82095),
                  const LatLng(26.78192,75.82093 ),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "c") {
                List<LatLng> latlng1=[
                  const  LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.819730),
                  const LatLng(26.78167,75.819731),
                  const LatLng( 26.78140,75.81930),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "a") {
                List<LatLng> latlng1 =[
                  const LatLng(26.78167,75.819730),
                  const LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.81985),
                 // LatLng(26.78165,75.82020),
                  const LatLng(26.78218,75.82028),
                  const LatLng(26.78220,75.82030),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78215,75.82156),
                  const LatLng(26.78192,75.82156),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "g") {
                List<LatLng> latlng1 =[
                  const LatLng(26.78167,75.819730),
                  const LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.81985),
                  const LatLng(26.78165,75.82020),
                  const LatLng(26.78218,75.82028),
                  const LatLng(26.78220,75.82030),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78224,75.82055 ),
                  const LatLng(26.78280,75.82058),
                  
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "e") {
                List<LatLng> latlng1 =[
                 //  const LatLng(26.78167,75.819730),
                 // const LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.8196),
                const LatLng(26.78165,75.82020),
                   const LatLng(26.78218,75.82028),
                  const LatLng(26.78220,75.82031),
                   const LatLng(26.78222,75.82041),
                   const LatLng(26.78215,75.82156),
                   const LatLng(26.78192,75.82155),
                   const LatLng(26.78170,75.82154),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
            }
            //start e
              else if(def=="e" ) {
              if (def2 == "b") {
                List<LatLng> latlng1=[
                  const LatLng(26.78155,75.82156),
                  const LatLng(26.78192,75.82156),
                  const LatLng(26.78215,75.82156),
                  const LatLng(26.78217,75.82095),
                  const LatLng(26.78192,75.82093 ),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "c") {
                List<LatLng> latlng1 =[
                  const  LatLng(26.78170,75.82156),
                  const LatLng(26.78192,75.82156),
                  const LatLng(26.78215,75.82156),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78218,75.82028),
                  const LatLng(26.78165,75.82020),
                  const LatLng(26.78167,75.81985),
                  const LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.819733),
                  const LatLng(26.78167,75.819731),
                  const LatLng( 26.78140,75.81930),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "a") {
                List<LatLng> latlng1 =[
                  const LatLng(26.78170,75.82156),
                  const LatLng(26.78192,75.82156),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "g") {
                List<LatLng> latlng1 =[
                  const LatLng(26.78170,75.82156),
                  const LatLng(26.78192,75.82156),
                  const LatLng(26.78215,75.82156),
                  const LatLng(26.78224,75.82055 ),
                  const LatLng(26.78280,75.82058),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "d") {
                List<LatLng> latlng1 =[
                  const LatLng(26.78170,75.82156),
                  const LatLng(26.78192,75.82156),
                const LatLng(26.78215,75.82156),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78220,75.82030),
                  const LatLng(26.78220,75.82030),
                  const LatLng(26.78165,75.82020),
                  const LatLng(26.78167,75.8196),
                //  const LatLng(26.78165,75.81984),
               // const LatLng(26.78167,75.81970),
                // const LatLng(26.78167,75.819730),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
            }

              else if(def=="g" ) {
              if (def2 == "b") {
                List<LatLng> latlng1=[
                  const                    LatLng(26.78265,75.82058),
                  const LatLng(26.78224,75.82055 ),
                  const LatLng(26.78217,75.82095),
                  const LatLng(26.78192,75.82093 ),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "c") {
                List<LatLng> latlng1 =[
                  const                   LatLng(26.78265,75.82058),
                  const LatLng(26.78224,75.82055 ),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78220,75.82030),
                  const LatLng(26.78218,75.82028),
                  const LatLng(26.78165,75.82020),
                  const LatLng(26.78167,75.81985),
                  const LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.819730),
                  const LatLng(26.78167,75.819730),
                  const LatLng(26.78167,75.819731),
                  const LatLng( 26.78140,75.81930),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "a") {
                List<LatLng> latlng1 =[
                  const                   LatLng(26.78280,75.82058),
                  const LatLng(26.78224,75.82055 ),
                  const LatLng(26.78215,75.82156),
                  const LatLng(26.78192,75.82156),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "e") {
                List<LatLng> latlng1 =[
                  const                   LatLng(26.78280,75.82058),
                  const LatLng(26.78224,75.82055 ),
                  const LatLng(26.78215,75.82156),
                  const LatLng(26.78192,75.82156),
                  const LatLng(26.78170,75.82156),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
              else if (def2 == "d") {
                List<LatLng> latlng1 =[
                  const    LatLng(26.78280,75.82058),
                  const LatLng(26.78224,75.82055 ),
                  const LatLng(26.78222,75.82040),
                  const LatLng(26.78220,75.82030),
                  const LatLng(26.78218,75.82028),
                  const LatLng(26.78165,75.82020),
                  const LatLng(26.78167,75.81985),
                  const LatLng(26.78167,75.81980),
                  const LatLng(26.78167,75.819730),
                ];
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => latlng(latlng1),
                    ));
              }
            }


            else
              {
                print("ff");
              }

                },
           child: const Text("Submit")
           ),

          

          //SafeArea(

          Expanded(
            child: GoogleMap(
              initialCameraPosition: _kgoogleplex,
             // mapType: MapType.normal,
              mapType: MapType.normal,
              markers: Set<Marker>.of(_marker) ,
              onMapCreated: (GoogleMapController conroller){
                _controller.complete(conroller);
                },
            ),
          ),
      ],
    ),
        // ),
        //],
      //),

    floatingActionButton: FloatingActionButton(

        onPressed: (){

          getUserCurrentLocation().then((value) async {
            //print('my current location');

           // print(value.latitude.toString() +" " + value.longitude.toString());

            _marker.add(
              Marker(
                  markerId:const MarkerId('4'),
                position:LatLng(value.latitude ,value.longitude),
               //icon: BitmapDescriptor.hueCyan,
               icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                infoWindow: const InfoWindow(
                  title: "My current location"
                )
              )
            );
            CameraPosition cameraPosition=CameraPosition(
              zoom: 19.1521678,
                target: LatLng(value.latitude ,value.longitude));

            final GoogleMapController controller =await _controller.future;

            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {

            });

          });

        },
      //backgroundColor: Colors.blue,
        child: const Icon(Icons.local_bar ),

      ),
     );
  }
}
