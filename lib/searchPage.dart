import 'package:flutter/material.dart';
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //aty ny manova an le appbar
Icon searchIcon = Icon(Icons.search);
Widget appBarTitle = Text("Find your music Here", style: TextStyle(color: Colors.black,fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.normal),);
final TextEditingController filter = new TextEditingController();
//variables manday ny texte antsofoka
String onChange;
String onSubmit;
  void searchFunction(){
    setState(() {
      if(this.searchIcon.icon == Icons.search){
        this.searchIcon = Icon(Icons.close);
        this.appBarTitle = TextField(
          controller: filter,
          onChanged: (String string){
            setState(() {
              onChange = string;
            });
          },
            onSubmitted: (String string){
            setState(() {
              onSubmit = string;
            });
            },
          decoration: InputDecoration(
            hoverColor: Colors.black,
            focusColor: Colors.black,
            fillColor: Colors.black,

            suffixIcon: Icon(Icons.search, color: Colors.black,),
            hintText: 'You want to listen to ...'
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: appBarTitle,
        centerTitle: true,
        actions: [
          IconButton(
              icon: searchIcon,
              onPressed: searchFunction)
        ],
      ),
      body:
      //Mbola tsy misy dikany ity
      Center(
        child: Column(
          children: [
            Text(onChange?? ''),
            Text(onSubmit == null? '':"you searched for $onSubmit"),
          ],
        )
      )
    );
  }
}
