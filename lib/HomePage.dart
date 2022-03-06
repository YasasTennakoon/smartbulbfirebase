import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(

      home: StartUpPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class StartUpPage extends StatefulWidget {
  const StartUpPage({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _StartUpPage();
  }
}

class _StartUpPage extends State<StartUpPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

    body: Container(
        alignment: Alignment.topCenter, //inner widget alignment to center
        padding: const EdgeInsets.all(20),
        //color: Colors.blueAccent,
        decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("images/background.jpg"),fit: BoxFit.cover)),
    child: Column(
    children:  [
      // ignore: avoid_unnecessary_containers
      Container(
        child: const Padding(
          padding:
          EdgeInsetsDirectional.fromSTEB(0, 35, 0,0),
          child: Text("Smart Bulb",
          style: TextStyle(
            fontSize: 70.0,
            fontWeight: FontWeight.bold,
            color:Colors.black,
          ),),
        ),
      ),

      Container(
        child:  Padding(
          padding:
          const EdgeInsetsDirectional.fromSTEB(0, 20, 0,0),
          child: Image.asset("images/lamp.jpg",height: 320,    width: 320,),

        ),

      ),

      Container(

        child:const Padding(
          padding:
          EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
          child: Text("Auto Mate Your Life with your\n        new Smart Bulb App",
            style:TextStyle
              (
              fontSize:25.0,
              fontWeight:FontWeight.bold,
              color: Colors.black,

            ),
          ),

        ),

      ),

      Container(
          child: const Padding(
            padding:
            EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Text("Click Next To Discover",
              style:TextStyle
                (
                fontSize:20.0,
                fontWeight:FontWeight.bold,
                color: Colors.black54,
              ),),
          )

      ),

      Container(

        child: Padding(
          padding:
          const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),

          child: FlatButton(
            color: Colors.black,
            colorBrightness: Brightness.dark,
            child:  const Text('NEXT',
              style:TextStyle
                (
                fontSize:20.0,
                fontWeight:FontWeight.bold,

              ),),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp() ),
              );
            },

          )
        )

      )

    ],
    )
      ),

    );
  }

}