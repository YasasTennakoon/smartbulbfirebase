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

          child: FlatButton(
            color: Colors.black,
            colorBrightness: Brightness.dark,
            child: const Text('NEXT',
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

    ],
    )
      ),

    );
  }

}