
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'fileData.dart';
class DownloadContent extends StatefulWidget {
  @override
  _DownloadContentState createState() => _DownloadContentState();
}

class _DownloadContentState extends State<DownloadContent> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;

//momoba ilay dropDownList

  String page = 'songs';
  List<DropdownMenuItem> listOfPages = [];

  void songOrAlbum(){
    listOfPages.clear();
    listOfPages.add(
        DropdownMenuItem(
            value: "songs",
            child: Text('Songs')
        )
    );

    listOfPages.add(
        DropdownMenuItem(
            value: "album",
            child: Text('Album')
        )
    );
  }


  Widget songAlbumView(){
    if(page == "songs"){
      return ListView.builder(
          controller: controller ,
          itemCount: albumFile.length,
          itemBuilder: (context, int index){
            List<dynamic> responseList = albumFile;
            List<Widget> listItems =[];
            responseList.forEach((post) {
              listItems.add(
                GestureDetector(
                  onTap: null,
                  child:Container(
                    color: Colors.white,
                    height: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 10,),
                    padding: EdgeInsets.all(5.0),
                    child: Row(

                      children: [
                        Image.asset(
                          "assets/${post["image"]}",
                          height: double.infinity,
                        ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              post["albumName"],
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              post["artist"],
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
                            ),
                          ],
                        )
                      ],
                    ),

                  ),
                ),

              );

            });
            return listItems[index];
          });
    }else {
      List<Widget> albumView = [];
      for( var i = 0; i < albumFile.length; i++){
        final albumInfo = albumFile[i];
        final String albumName = albumInfo["albumName"];
        final String albumJacket = albumInfo["image"];
        final String artistName = albumInfo["artist"];
        albumView.add(
          Card(
            elevation: 5.0,
            child: Container(
                 width: MediaQuery.of(context).size.width/2.5,
            
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(

                    child: Hero(
                        tag: Text(artistName,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green),),
                        child: Material(
                          child: InkWell(
                            child: Container(
                              height: 140,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                      image: AssetImage('assets/$albumJacket'),
                                      fit: BoxFit.fill )
                              ),
                            ),
                            //ny fonction mipetaka eto le mandefa an le hira ann!!!
                            onTap: null,
                          ),
                        )
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(albumName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),),
                      Text(artistName,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.green),)
                    ],
                  ),
                ],
              ),


            ),
          ),

        );
      }
      return Container(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          physics: BouncingScrollPhysics(),

          children: albumView,
        ),
      );
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        closeTopContainer = controller.offset >50;
      });
    });
    songAlbumView();
  }

//Famenona an le album



  @override
  Widget build(BuildContext context) {
    songOrAlbum();
    final Size size = MediaQuery.of(context).size;


    return SafeArea(
      child:Scaffold(
        backgroundColor: Color(0x97FFFFFF),
        body:Container(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              //favorites album
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Downloaded Music", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  //mbol   ho definisena
                  DropdownButton(
                    value: page,
                    elevation: 0,
                    items: listOfPages,
                    style: TextStyle(color: Colors.green),
                    onChanged: (value){

                      setState(() {
                        page = value;
                      });

                    },

                  )
                ],
              ),
              Expanded(
                child: songAlbumView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
