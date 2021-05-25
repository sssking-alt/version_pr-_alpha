import 'package:flutter/material.dart';
import 'package:zara/PlaylistContent.dart';
import 'favoritesContent.dart';
import 'downloadContent.dart';
import 'searchPage.dart';

class all extends StatefulWidget {
  @override
  _allState createState() => _allState();
}

class _allState extends State<all> {
  void changePageToSearch(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return Search();
    }));
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //mampiseho an ilay liste
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title:  Text("Your Library", style: TextStyle(color: Colors.black,fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                  icon: Icon(Icons.search, color: Colors.black,),
                  onPressed: changePageToSearch,
              )
            ],
            bottom: TabBar(
              indicatorColor: Colors.green ,
                tabs: <Widget>[
               //tabs eo ambony
               Tab(child: Text("Playlist",style: TextStyle(color: Colors.black,fontSize: 15.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),),
                  Tab(child: Text("Favorites",style: TextStyle(color: Colors.black,fontSize: 15.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),),
                  Tab(child: Text("Downloads",style: TextStyle(color: Colors.black,fontSize: 15.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),),
                ]),
          ),
//contenu an le tab
          body: TabBarView(children: [
            //any am fichier playlist content
            playlistContent(),
            favoriteContent(),
            DownloadContent(),



            //any am fichier favoritesContent


        ]),

        ) ,
      ),
    );
  }
}

