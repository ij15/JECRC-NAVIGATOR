import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'package:jecrc_navigator/start.dart';

 class latlng extends StatefulWidget {
 // const latlng( {super.key});
  List<LatLng> list=[];
  latlng(this.list, {super.key});

  @override
  State<latlng> createState() => latlngo();
}

class latlngo extends State<latlng> {

  final Completer<GoogleMapController> _controller = Completer();

  final Set<Polyline> _polyline={};
  @override
  void initState(){
    super.initState();

    for(int i=0;i<widget.list.length;i++){
      setState(() {
      });
      _polyline.add(
        Polyline(polylineId: const PolylineId('1'),
            points: widget.list,
            color: Colors.blue
        ),
      );
    }
  }
  Future<Position> getUserCurrentLocation() async{
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace) {
      //print("error"+error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }



  @override
  Widget build(BuildContext){
    double totalDistance = calculateDistance(widget.list);
    double walkingSpeedKmPerHour = 4.5;
    double timeInHours = double.parse((totalDistance/1000 / walkingSpeedKmPerHour).toStringAsFixed(2))*60;
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;



    // print(timeInHours);
    // print(totalDistance);
    return Scaffold(


      appBar: AppBar(
        title: const Text("Destination"),
      ),


      body:Column(
        children: [
          Expanded(
            child:
            //fit: StackFit.expand,
            GoogleMap(
              markers: {
                Marker(
                markerId: const MarkerId('2'),
                position: widget.list[0],
                infoWindow: const InfoWindow(
                title: 'Starting point'
                )
                ),
                Marker(
                markerId: const MarkerId('3'),
                position: widget.list[widget.list.length-1],
                infoWindow: const InfoWindow(
                title: 'Destination point'
                )
                ),
                },
              onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
              },
              polylines: _polyline,
              myLocationEnabled: true,
              initialCameraPosition:  CameraPosition(
                target: widget.list[0] ,
                zoom: 17.15772545,
               // zoom: 19.15772545,
              ),
              mapType: MapType.normal,
            ),
          ),


      Container(
        height: 130,
       // margin:  EdgeInsets.only(top: 500, bottom: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child:
        Column(
          children: [
            Row(
              children: [

                Text("  $timeInHours min ($totalDistance m)", style: const TextStyle(fontSize: 35,),),
              ],
            ),
            // Positioned(child: Container(
            //   height:0, // Height of the bottom container
            //   color: Colors.black,
            // )),
            Row(
              children: [
                ElevatedButton(onPressed: ( ){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Start(widget.list),
                      ));

                },
                  style:
                  ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(const Size(130, 55),),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent) ,
                  ),
                  child: const Text("Start", style: TextStyle(fontSize: 30, color: Colors.black,), ),
                ),
              ],
            ),
            // Positioned(child: Container(
            //   height: 100, // Height of the bottom container
            //   color: Colors.white,
            // ))
          ],
        ),
      ),
      ],
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: (){

          getUserCurrentLocation().then((value) async {
            //print('my current location');

            //print(value.latitude.toString() +" " + value.longitude.toString());

            Marker(
                    markerId:const MarkerId('4'),
                    position:LatLng(value.latitude ,value.longitude),
                    //icon: BitmapDescriptor.hueCyan,
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                    infoWindow: const InfoWindow(

                        title: "My current location"
                    )
                );


            CameraPosition cameraPosition=CameraPosition(
                zoom: 19.1432678,
                target: LatLng(value.latitude ,value.longitude));

            final GoogleMapController controller =await _controller.future;

            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {

            });

          });

        },

        //backgroundColor: Colors.orangeAccent,

        child: const Icon(Icons.local_bar ),
      ),
    );
  }
}
double calculateDistance(List<LatLng> latLngList) {
  double totalDistance = 0.0;

  for (int i = 0; i < latLngList.length - 1; i++) {
    double lat1 = latLngList[i].latitude;
    double lon1 = latLngList[i].longitude;
    double lat2 = latLngList[i + 1].latitude;
    double lon2 = latLngList[i + 1].longitude;

    double distance = _calculateDistanceBetweenTwoPoints(lat1, lon1, lat2, lon2);
    totalDistance += distance;
  }

  return double.parse(totalDistance.toStringAsFixed(2))*1000;
}

double _calculateDistanceBetweenTwoPoints(double lat1, double lon1, double lat2, double lon2) {
  const double earthRadius = 6371.0; // Radius of the Earth in kilometers

  double dLat = _degreesToRadians(lat2 - lat1);
  double dLon = _degreesToRadians(lon2 - lon1);

  double a = pow(sin(dLat / 2), 2) +
      cos(_degreesToRadians(lat1)) * cos(_degreesToRadians(lat2)) * pow(sin(dLon / 2), 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  double distance = earthRadius * c;

  return distance;
}

double _degreesToRadians(double degrees) {
  return degrees * pi / 180;
}
