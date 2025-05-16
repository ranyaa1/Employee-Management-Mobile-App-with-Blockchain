import 'package:flutter/material.dart';
import 'package:untitled/screens/signIn.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
// Show confirmation dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirmation"),
                    content: Text("Are you sure you want to log out?"),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green))
                      ),
                      ElevatedButton(
                        child: Text("Log Out"),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      signIn()));
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red)
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
     ));
  //  body: Column()
       // children: [
         // Expanded(
           // child: WebView(
             // initialUrl: "io.adafruit.com",
              //javascriptMode: JavascriptMode.unrestricted,
              //onWebViewCreated: (WebViewController webViewController) {
              //},
            //  gestureNavigationEnabled: true,
            //),
          //),
          //Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //children: [
              //ElevatedButton(
                //child: Text("On"),
                //onPressed: () {
                  //_sendOnRequest();
                //},
                //style: ButtonStyle(
                  //  backgroundColor: MaterialStateProperty.all(Colors.green),
                    //padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
              //),
              //ElevatedButton(
                //child: Text("OFF"),
                //onPressed: () {
                  //_sendOffRequest();
                //},
                //style: ButtonStyle(
                  //  backgroundColor: MaterialStateProperty.all(Colors.red),
                    //padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
             // ),
            //],
         // )
        //],
      //),
    //);
  //}
//}

//void _sendOnRequest() async {
 // final response = await http.get(Uri.parse('http://192.168.1.20/on'));
  //print(response.body);
//}

//void _sendOffRequest() async {
  //final response = await http.get(Uri.parse('http://192.168.1.20/off'));
  //print(response.body);//
}}