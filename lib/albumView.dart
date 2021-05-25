
import 'package:flutter/cupertino.dart';

import 'homepage.dart';
import 'package:flutter/material.dart';
import 'fileData.dart';
class AlbumView extends StatefulWidget {
  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width:  MediaQuery.of(context).size.width,
      color: Colors.white,
      child: CustomScrollView(

            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: (){
                  Navigator.pop(context);
                },),

                elevation: 0.0,
                pinned: true,
                toolbarHeight: 80,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    margin: EdgeInsets.only(top: 35.0),
                    child: Column(
                      children: [
                        Text(albumFile[index1]["albumName"], style: TextStyle(color: Colors.black, fontSize: 20.0),overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 10.0,),
                        Text(" by ${albumFile[index1]["artist"]}", style: TextStyle(color: Colors.black54, fontSize: 10.0),overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  ),
                  centerTitle: true,

                  background: Image.asset("assets/${albumFile[index1]["image"]}",
                  fit: BoxFit.cover,
                  ),
                ),

              bottom:
              PreferredSize(

                  preferredSize: const Size.fromHeight(0.0),
                  child: Transform.translate(

                      offset: const Offset(0, 35),
                    child: Container(

                        padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [


                          ElevatedButton(
                            style: ElevatedButton.styleFrom(

                                primary: Colors.green,
                                elevation: 5.0,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10.0)
                            ),

                            onPressed: (){},
                            child: Icon(
                              Icons.play_arrow,
                              size: 40.0,
                            ),

                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(

                                primary: Colors.green,
                                elevation: 5.0,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10.0)
                            ),

                            onPressed: (){},
                            child: Icon(
                              Icons.shuffle_rounded,
                              size: 30.0,
                            ),

                          ),
                          /*ElevatedButton(
                              style: ElevatedButton.styleFrom(

                                primary: Colors.green,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),

                                )
                              ),

                              onPressed: (){},
                              child: Icon(
                                Icons.play_arrow_rounded,
                                size: 30.0,
                              ),

                          ),*/
                        ],
                      ),
                    )

                  ),
                ),

              ),
              /*SliverPadding(
                  padding: EdgeInsets.only(top: _appBarBottomBtnPosition)
              ),*/
              SliverToBoxAdapter(
                  child: Container(

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                            onPressed: null,
                            icon: Icon(Icons.star_border, size: 30,color: Colors.black54,),
                            label: Text("Support if you like !!", style: TextStyle(fontSize: 15.0, ),)),
                      ],
                    ),
                  ),
              ),
              
              SliverList(
                delegate: SliverChildBuilderDelegate(

                  (BuildContext context, int index ){
                    List<dynamic> responseLis = songs1;

                    List<Widget> listItems =[];
                    responseLis.forEach((post) {

                      listItems.add(
                        GestureDetector(
                            onTap: (){
                            },
                            child: Container(

                              padding: EdgeInsets.all(3.0),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/${post["image"]}"),
                                        fit: BoxFit.fill
                                      )
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  Container(
                                    width: MediaQuery.of(context).size.width-100,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(post["albumName"], style: TextStyle( fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.normal, decoration: TextDecoration.none),overflow: TextOverflow.ellipsis,),
                                        SizedBox(height: 10.0,),
                                        Text(post["artist"], style: TextStyle( fontSize: 10.0, color: Colors.green, fontWeight: FontWeight.normal, decoration: TextDecoration.none),overflow: TextOverflow.ellipsis,),
                                      ],
                                    ),
                                  )
                                ],

                              )
                            ),


                        ),

                      );

                    });
                    for(index; index< songs1.length; index++){
                      return listItems[index];
                    }
                  }

              ),
              )
            ],

          ),

    );


  }

}


