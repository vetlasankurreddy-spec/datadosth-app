import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
void main(){runApp(const MyApp());}
class MyApp extends StatelessWidget{const MyApp({super.key});@override Widget build(BuildContext c){return MaterialApp(debugShowCheckedModeBanner:false,title:'DATA DOSTH',home: const HomeScreen());}}
class HomeScreen extends StatefulWidget{const HomeScreen({super.key});@override State<HomeScreen> createState()=>_HomeScreenState();}
class _HomeScreenState extends State<HomeScreen>{
String place="Location Loading...";String addr="";
@override void initState(){super.initState();getLoc();}
Future<void> getLoc() async{
try{
bool s=await Geolocator.isLocationServiceEnabled(); if(!s){setState(()=>place="Please ON GPS");return;}
LocationPermission p=await Geolocator.checkPermission(); if(p==LocationPermission.denied){p=await Geolocator.requestPermission();}
if(p==LocationPermission.denied){setState(()=>place="Rayachoti");return;}
Position pos=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
List<Placemark> pm=await placemarkFromCoordinates(pos.latitude,pos.longitude);
if(pm.isNotEmpty){setState((){place=pm[0].locality??pm[0].subLocality??"Rayachoti"; addr="${pm[0].subLocality}, ${pm[0].locality}, ${pm[0].administrativeArea}";});}
}catch(e){setState(()=>place="Rayachoti");}
}
@override Widget build(BuildContext c){
return Scaffold(appBar: AppBar(backgroundColor:Colors.blue,title: Text("DATA DOSTH - $place",style: const TextStyle(color:Colors.white,fontSize:16))),body: Center(child: Padding(padding: const EdgeInsets.all(20),child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
const Icon(Icons.location_on,size:80,color:Colors.red),const SizedBox(height:20),const Text("You are in:"),Text(place,style: const TextStyle(fontSize:32,fontWeight: FontWeight.bold,color:Colors.blue)),Text(addr,textAlign: TextAlign.center),const SizedBox(height:30),
ElevatedButton.icon(style: ElevatedButton.styleFrom(backgroundColor:Colors.red,padding: const EdgeInsets.symmetric(horizontal:40,vertical:15)),icon: const Icon(Icons.sos,color:Colors.white),label: const Text("SOS - NEED DATA",style: TextStyle(color:Colors.white,fontSize:18)),onPressed: (){ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text("SOS Sent from $place!")));}),
const SizedBox(height:15),ElevatedButton(onPressed: getLoc, child: const Text("Refresh Location"))
]))));
}
}
