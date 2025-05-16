import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled/screens/signIn.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                signIn()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFA88377),Color(0xFF4E342E),]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [

                Image.asset(
                  "assets/images/Aures.png",
                  height: 300.0,
                  width: 300.0,
                ),
            Text("TOUCH THE DIFFERENCE",textAlign:TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),),
              ],
            ),
            CircularProgressIndicator(
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.brown.shade900),
            ),
          ],
        ),
      ),
    );
  }
}