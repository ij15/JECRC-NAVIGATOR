import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jecrc_navigator/poly_lines.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreens> {

  final Completer<GoogleMapController> _controller= Completer();
  final TextEditingController _searchController = TextEditingController();
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
      appBar: AppBar(title: const Text('JECRC NAVIGATOR'),backgroundColor: Colors.blue,),
      body:Column(
        children: [
          Row(children: [
            Expanded(child: TextFormField(
              controller: _searchController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(hintText: 'Search'),
              onChanged: (value){
                //print(value);
              },
            ),),

            IconButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Polylines(),
                  ));
            }, icon: const Icon(Icons.search),),
          ],),
          // SafeArea(

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
          //  ),
        ],
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){

          getUserCurrentLocation().then((value) async {
            //print('my current location');

            //print(value.latitude.toString() +" " + value.longitude.toString());

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
        child: const Icon(Icons.local_bar ),
      ),
    );
  }
}
