import 'package:flutter/material.dart';
void main(){runApp(const MyApp());}
class MyApp extends StatelessWidget{
const MyApp({super.key});
@override Widget build(BuildContext c){
return MaterialApp(debugShowCheckedModeBanner: false,
home: Scaffold(appBar: AppBar(backgroundColor: Colors.blue,title: const Text("DATA DOSTH",style: TextStyle(color:Colors.white))),
body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
const Icon(Icons.location_on,size:80,color:Colors.red),
const Text("Rayachoti / Gajwel",style: TextStyle(fontSize:28,fontWeight: FontWeight.bold)),
const SizedBox(height:20),
ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor:Colors.red,padding: const EdgeInsets.symmetric(horizontal:40,vertical:20)),
child: const Text("SOS - NEED DATA",style: TextStyle(color:Colors.white,fontSize:18))),
]))));
}
}
