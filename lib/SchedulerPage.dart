import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'main.dart';

class SchedulerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(

      home: schedulerpage(),
      debugShowCheckedModeBanner: false,
    );
  }

}
class schedulerpage extends StatefulWidget {
  const schedulerpage({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _schedulerpage();
  }
}

class _schedulerpage extends State<schedulerpage> {

  final List<Widget> _children = [
    MyApp(),
    SchedulerPage()

  ];
  final int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back, color: Colors.black,),
          title: const Text("Scheduler Page",
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


        ),
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