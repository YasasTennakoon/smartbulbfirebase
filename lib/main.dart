// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'HomePage.dart';
import 'SchedulerPage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomePage());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(

      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  // @override
  // State<MyHomePage> createState() => _MyHomePageState();
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}


class _MyHomePageState extends State<MyHomePage> {
  String On="OFF";
  bool light=false;
  int _value = 10;
  int _values= 0;
  final dbR= FirebaseDatabase.instance.reference();

  _onTap(int index) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return _children[index];
    }));}


  final List<Widget> _children = [
    MyApp(),
    SchedulerPage()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.black,),
        title: const Text("Smart Bulb",
        style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize:24
          ),),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover)),


        child: Column(
         // mainAxisAlignment: MainAxisAlignment.topCenter,
          children: <Widget>[

            Container(
              child:Padding(
                  padding:
            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child:light ? Image.asset( 'images/light-on.png',    height: 205,    width: 205, )
                  : Image.asset( 'images/light-off.png',    height: 205,    width: 205, ),
             // child:Image.asset("images/light-on.png",height: 200,    width: 200,),

            ),
            ),


            FlatButton(
              child:Image.asset("images/power2.png",height: 50,    width: 50,),
             // child:Text("LedON"),
              //color: Colors.blue,
              onPressed: (){
                if (light) {
                  //if ledstatus is true, then turn off the led
                  //if led is on, turn off
                  dbR.child("Light").set({"Switch": "OFF"});
                  light = false;
                } else {
                  //if ledstatus is false, then turn on the led
                  //if led is off, turn on
                  dbR.child("Light").set({"Switch": "ON"});
                  light = true;
                }
                setState(() {
                  if(light==false)
                    {
                      On="OFF";
                      _value=0;
                      _values=0;
                    }
                  if(light==true)
                  {
                     On="ON";
                  }
                });


              },
            ),

            Container(
              child:Padding(
                  padding:
                  const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child:light ? const Text("BULB IS ON",style: TextStyle(
                    fontSize:14.0,
                    fontWeight:FontWeight.bold,
                    color: Colors.black,
                  )) : const Text("BULB IS OFF",style: TextStyle(
                    fontSize:14.0,
                    fontWeight:FontWeight.bold,
                    color: Colors.black,
                  ),)


              ),
            ),

            Container(
             child:Padding(
             padding:
             const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                  children: const <Widget>[
                    Text("Brightness",
                    style: TextStyle(

                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),)

                  ]

              ),

              ),
            ),

            Container(

                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(
                        Icons.lightbulb_outline,
                        color: Colors.amber,
                        size: 30,
                      ),
                      Expanded(
                        child: Slider(
                            value: _value.toDouble(),
                            min: 0.0,
                            max: 100.0,
                            divisions: 10,
                            activeColor: Colors.black,
                            inactiveColor: Colors.white,
                            label: '${_value.round()}',
                            onChanged: (double newValue) {
                              setState(() {
                                _value = newValue.round();
                                if(light==true) {
                                  if (_value == 0) {
                                    dbR.child("Light").set({"Switch": "0"});
                                  }
                                  if (_value == 10) {
                                    dbR.child("Light").set({"Switch": "10"});
                                  }
                                  if (_value == 20) {
                                    dbR.child("Light").set({"Switch": "20"});
                                  }
                                  if (_value == 30) {
                                    dbR.child("Light").set({"Switch": "30"});
                                  }
                                  if (_value == 40) {
                                    dbR.child("Light").set({"Switch": "40"});
                                  }
                                  if (_value == 50) {
                                    dbR.child("Light").set({"Switch": "50"});
                                  }
                                  if (_value == 60) {
                                    dbR.child("Light").set({"Switch": "60"});
                                  }
                                  if (_value == 70) {
                                    dbR.child("Light").set({"Switch": "70"});
                                  }
                                  if (_value == 80) {
                                    dbR.child("Light").set({"Switch": "80"});
                                  }
                                  if (_value == 90) {
                                    dbR.child("Light").set({"Switch": "90"});
                                  }
                                  if (_value == 100) {
                                    dbR.child("Light").set({"Switch": "100"});
                                  }
                                }

                              });
                            },
                            //label: 'Bulb Brigtness',
                            semanticFormatterCallback: (double newValue) {
                              return '${newValue.round()} dollars';
                            }

                        ),

                      ),
                      const Icon(
                        Icons.lightbulb,
                        color: Colors.amber,
                        size: 30,
                      ),
                    ]
                )


            ),

            Container(
              child: Padding(
                padding:
                const EdgeInsetsDirectional.fromSTEB(0, 0, 0,0),
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: const [

                      Text("Color",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,

                        ),)

                    ]


                )
              )

            ),

            Container(
              decoration: BoxDecoration(color: Colors.white54,borderRadius:  BorderRadius.circular(16.0),),
              height: 30,
              margin: const EdgeInsets.all(30.0),

              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget> [
                    FlatButton(
                      child: const Text(""),
                      color: Colors.red,
                      height: 20,
                      minWidth: 10,
                      onPressed: () {
                        if(light==true)
                        {
                          dbR.child("Light").set({"Switch": "red"});
                        }

                      },
                    ),

                    FlatButton(
                      child: const Text(""),
                      color: Colors.green,
                      height: 20,
                      minWidth: 10,
                      onPressed: () {

                        if(light==true)
                        {
                          dbR.child("Light").set({"Switch": "green"});
                        }

                      },
                    ),

                    FlatButton(
                      child: const Text(""),
                      color: Colors.blue,
                      height: 20,
                      minWidth: 10,
                      onPressed: () {

                        if(light==true)
                        {
                          dbR.child("Light").set({"Switch": "blue"});
                        }

                      },
                    ),

                    FlatButton(
                      child: const Text(""),
                      color: Colors.yellow,
                      height: 20,
                      minWidth: 10,
                      onPressed: () {

                        //if(light==true)
                        //{
                          //dbR.child("Light").set({"Switch": "yellow"});
                          //light=true;
                          dbR.child("Light").set({"Switch": "ON"});
                          dbR.child("Light").set({"Switch": "30"});
                          dbR.child("Light").set({"Switch": "red"});
                        //}

                      },
                    ),

                  ]

              ),

            ),

            Container(
                child: Padding(
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(0, 0, 0,0),
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: const [

                          Text("Color Temperature",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,

                            ),)

                        ]


                    )
                )

            ),

            Container(

                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(
                        Icons.lightbulb,
                        color: Colors.red,
                        size: 30,
                      ),
                      Expanded(
                        child: Slider(
                            value: _values.toDouble(),
                            min: 0.0,
                            max: 100.0,
                            divisions: 10,
                            activeColor: Colors.black,
                            inactiveColor: Colors.white,
                            label: '${_values.round()}',
                            onChanged: (double newValue) {
                              setState(() {
                                _values = newValue.round();
                                if(light==true) {
                                  if (_values == 0) {

                                    //dbR.child("Light").set({"Switch": "red1blue1"});

                                   }
                                  if (_values == 10) {

                                    dbR.child("Light").set({"Switch": "red1blue1"});

                                  }
                                  if (_values == 20) {

                                    dbR.child("Light").set({"Switch": "red2blue2"});
                                  }
                                  if (_values == 30) {

                                    dbR.child("Light").set({"Switch": "red3blue3"});
                                  }
                                  if (_values == 40) {

                                    dbR.child("Light").set({"Switch": "red4blue4"});
                                  }
                                  if (_values == 50) {

                                    dbR.child("Light").set({"Switch": "red5blue5"});
                                  }
                                  if (_values == 60) {

                                    dbR.child("Light").set({"Switch": "red6blue6"});
                                  }
                                  if (_values == 70) {

                                    dbR.child("Light").set({"Switch": "red7blue7"});
                                  }
                                  if (_values == 80) {

                                    dbR.child("Light").set({"Switch": "red8blue8"});
                                  }
                                  if (_values == 90) {

                                    dbR.child("Light").set({"Switch": "red9blue9"});
                                  }
                                  if (_values == 100) {

                                    dbR.child("Light").set({"Switch": "red10blue10"});
                                  }
                                }

                              });
                            },
                            //label: 'Bulb Brigtness',
                            semanticFormatterCallback: (double newValue) {
                              return '${newValue.round()} dollars';
                            }

                        ),

                      ),
                      const Icon(
                        Icons.lightbulb,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ]
                )


            ),



          ],
        ),
      ),//Main


      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  <Widget>[

            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.black,
              iconSize: 30.0,
              onPressed: () {

               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );

            },
              ),

           IconButton(
              icon: const Icon(Icons.schedule_outlined),
              color: Colors.black,
              iconSize: 30.0,
          onPressed: () {

           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SchedulerPage()),
              );
             },
    ),

              IconButton(
                icon: const Icon(Icons.settings),
                color: Colors.black,
                iconSize: 30.0,
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SchedulerPage()),
                  );
                },
              ),

    ]
        )
      ),
    );



  }
}
