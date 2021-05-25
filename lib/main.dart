
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'homepage.dart';
import 'musiclibrary.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  WidgetsApp.debugAllowBannerOverride = false;



    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          foregroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        )
      ),


      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;




  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
//variable misy an le page rehetra

final List<Widget> pageListContainer =[
  layout(),
  all(),
];
  //fonction miova page

int pageIndex = 0 ;













  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: pageListContainer[pageIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
          label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: "Your Library"),
        ],
        onTap: (index){
          setState(() {
            pageIndex = index;
          });

        },
        backgroundColor: Colors.white,
        elevation: 10.0,
        selectedItemColor: Colors.greenAccent,
      ),


    );
  }

}

