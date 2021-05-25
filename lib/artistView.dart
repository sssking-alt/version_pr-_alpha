import 'dart:ui';

import 'package:flutter/material.dart';
import 'homepage.dart';
import 'fileData.dart';

class ArtistView extends StatefulWidget {
  @override
  _ArtistViewState createState() => _ArtistViewState();
}

class _ArtistViewState extends State<ArtistView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: SingleChildScrollView(

        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),

        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 406,
              width: MediaQuery.of(context).size.width,
              color: Color(0xF7FFFFFF),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  //bouton miverina
                  Container(
                    color: Color(0xF7FFFFFF),
                    padding: EdgeInsets.only(top: 30.0,left: 5.0,right: 5.0),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.arrow_back, color: Colors.black87,size: 30.0,),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 50.0,),

                  //profil an le artist
                  Container(
                    alignment: Alignment.center,
                    color: Color(0xF7FFFFFF),
                    child: Column(
                      children: [
                        Card(
                            shape: CircleBorder(),
                          elevation: 20.0,
                          child: Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/${albumFile[index1]["image"]}"),
                                fit: BoxFit.cover
                              ),
                              shape: BoxShape.circle,
                            ),
                          )
                        ),
                        SizedBox(height: 10.0,),
                        Column(
                          children: [
                            Text(albumFile[index1]["artist"], style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Century'),),
                            SizedBox(height: 10.0,),

                            Text("${albumFile[index1]["subscriber"]} Subscribers", style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle:  FontStyle.italic),),
                            SizedBox(height: 10.0,),
                            ElevatedButton(

                                onPressed: (){},
                                child: Icon(Icons.play_arrow_rounded, size: 60,color: Colors.white,),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  primary: Colors.green,
                                  elevation: 10.0,
                                ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),

            //top song
            Row(
              children: [
                SizedBox(width: 5.0,),
                Text("Most Listened Song", style: TextStyle(color: Colors.black87, fontSize: 20.0, fontStyle: FontStyle.italic, decoration: TextDecoration.none,fontWeight: FontWeight.bold, fontFamily: 'Century'),overflow: TextOverflow.ellipsis,),

              ],
            ),
            SizedBox(height: 10.0,),
            Card(
              margin: EdgeInsets.all(10.0),
              elevation: 10.0,
              child: Container(

                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Column(

                  children: [
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/${albumFile[index1]["image"]}"),
                          fit: BoxFit.cover
                        )
                      ),
                    ),

                    Container(
                      height: 70,
                      alignment: Alignment.center,
                        child: Text("Top of ${albumFile[index1]["artist"]} Songs", style: TextStyle(color: Colors.black87, fontSize: 20.0, fontStyle: FontStyle.italic, decoration: TextDecoration.none,fontWeight: FontWeight.bold, fontFamily: 'Century'),overflow: TextOverflow.ellipsis,))
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),


            //Discography
            Container(
              padding: EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Discography", style: TextStyle(color: Colors.black87, fontSize: 20.0, fontStyle: FontStyle.italic, decoration: TextDecoration.none,fontWeight: FontWeight.bold, fontFamily: 'Century'),overflow: TextOverflow.ellipsis,),
                  Text("See all", style: TextStyle(color: Colors.grey, fontSize: 15.0, fontStyle: FontStyle.italic, decoration: TextDecoration.none,fontWeight: FontWeight.bold, fontFamily: 'Century'),overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height:240,
              width: MediaQuery.of(context).size.width,
              child: Discography(),
            ),
            //identification

            SizedBox(height: 20,),


            //also in
            Container(
              padding: EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Also In", style: TextStyle(color: Colors.black87, fontSize: 20.0, fontStyle: FontStyle.italic, decoration: TextDecoration.none,fontWeight: FontWeight.bold, fontFamily: 'Century'),overflow: TextOverflow.ellipsis,),
                  Text("See all", style: TextStyle(color: Colors.grey, fontSize: 15.0, fontStyle: FontStyle.italic, decoration: TextDecoration.none,fontWeight: FontWeight.bold, fontFamily: 'Century'),overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height:220,
              width: MediaQuery.of(context).size.width,
              child: AlsoIn(),
            )

          ],
        ),
      ),
    );

  }

  ScrollController controller = new ScrollController();

  Widget Discography(){
    return ListView.builder(
      padding: EdgeInsets.all(5.0),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        controller: controller,
        shrinkWrap: true,
        itemBuilder: (context, int index){
          List<dynamic> reference = songs0;
          List<Widget> listView = [];
          reference.forEach((element) {
            listView.add(
              GestureDetector(
                  child: Card(
                    elevation: 5.0,
                    child: Container(
                      width: MediaQuery.of(context).size.width/2.3 ,
                      height: 300,
                      margin: EdgeInsets.only(right: 5.0),
                      child: Column(
                        children: [
                          Card(
                            shape: CircleBorder(),
                            elevation: 5.0,
                            child: Container(
                              width: MediaQuery.of(context).size.width/2.3 ,
                              height: MediaQuery.of(context).size.width/2.3,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/${albumFile[index1]["image"]}"),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(element["albumName"],style: TextStyle(fontSize: 15.0, fontFamily: 'Century', decoration: TextDecoration.none, fontWeight: FontWeight.normal, color: Colors.black87, ),overflow: TextOverflow.ellipsis,),
                              Text(element["artist"],style: TextStyle(fontSize: 13.0, fontFamily: 'Century', decoration: TextDecoration.none, fontWeight: FontWeight.normal, color: Colors.green, ),overflow: TextOverflow.ellipsis,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
              )
            );
          });
          return listView[index];
        }
    );
  }
  Widget AlsoIn(){
    return ListView.builder(
        padding: EdgeInsets.all(5.0),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        controller: controller,
        shrinkWrap: true,
        itemBuilder: (context, int index){
          List<dynamic> reference = songs0;
          List<Widget> listView = [];
          reference.forEach((element) {
            listView.add(
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width/2.1 ,
                    height: 300,
                    margin: EdgeInsets.only(right: 10.0),
                    child: Column(
                      children: [
                        Card(

                          elevation: 10.0,
                          child: Container(
                            width: MediaQuery.of(context).size.width/2.3 ,
                            height: MediaQuery.of(context).size.width/2.3,
                            decoration: BoxDecoration(

                                image: DecorationImage(
                                    image: AssetImage("assets/${albumFile[index1]["image"]}"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(element["albumName"],style: TextStyle(fontSize: 15.0, fontFamily: 'Century', decoration: TextDecoration.none, fontWeight: FontWeight.normal, color: Colors.black87, ),overflow: TextOverflow.ellipsis,),
                            Text(element["artist"],style: TextStyle(fontSize: 13.0, fontFamily: 'Century', decoration: TextDecoration.none, fontWeight: FontWeight.normal, color: Colors.green, ),overflow: TextOverflow.ellipsis,),
                          ],
                        )
                      ],
                    ),
                  ),
                )
            );
          });
          return listView[index];
        }
    );
  }

}
