import 'dart:ui';
import 'package:zara/albumView.dart';
import 'musicPlayer.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:zara/searchPage.dart';
import 'fileData.dart';
import 'package:flutter/rendering.dart';
import 'artistView.dart';
import 'account.dart';



int index1 ;
class layout extends StatefulWidget {



  @override
  _layoutState createState() => _layoutState();
}

class _layoutState extends State<layout> {


  //Top Listened

  Widget topLIstened() {
   return ListView.builder(
       controller: controller ,
       itemCount: 3,
       itemBuilder: (context, int index){
         List<dynamic> responseList = albumFile;
         List<Widget> listItems =[];
         responseList.forEach((post) {
           listItems.add(
             GestureDetector(
               onTap: (){
                 index1 = index;
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                   return ArtistView();
                 }));
               },
               child:Card(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20.0)
                 ),
                 elevation: 5.0,
                 child: Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20.0)
                   ),
                   height: 70,
                   margin: const EdgeInsets.symmetric(horizontal: 10,),

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
             ),

           );

         });
         return listItems[index];
       });
  }


  ScrollController controller = new ScrollController();
  int index = 0;
  Timer timer;


  Widget pubView(){
    return SwipeDetector(
          child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/${albumFile[index]["image"]}"),
                    fit: BoxFit.cover
                )
            ),
          ),

          onSwipeLeft: (){
            setState(() {
              index ++;
            });
            if(index == albumFile.length){
              setState(() {
                index = 0;
              });
            }
          },

          onSwipeRight: (){
            setState(() {
              index --;
            });
            if(index <0 ){
              setState(() {
                index = albumFile.length - 1;
              });
            }
          },
          onSwipeDown: null,
          onSwipeUp: null,
          swipeConfiguration: SwipeConfiguration(
              horizontalSwipeMaxHeightThreshold: 50.0,
              horizontalSwipeMinDisplacement:50.0,
              horizontalSwipeMinVelocity: 50.0
          ),
        );
  }


  //exemple fisehony
  Widget horizontalScrollRecentPlayed(){
    return ListView.builder(

      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
        controller: controller ,
        itemCount: albumFile.length,
        itemBuilder: (context, int index){




            List<dynamic> responseList = albumFile;
          List<Widget> listItems =[];
          responseList.forEach((post) {
            listItems.add(
              GestureDetector(
                onTap: (){
                  index1 = index;
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                      return MusicPLayer();
                    }));

                },
                child: Container(
                  width: 110,
                  margin: EdgeInsets.only(left: 5.0,right: 2,bottom: 10.0,top: 10.0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 2.0,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/${post["image"]}"),
                              fit: BoxFit.fill,
                            )
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              post["albumName"],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              post["artist"],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 10.0,)
                    ],
                  ),
                )


              ),

            );

          });
          return listItems[index];
        });
  }



  Widget horizontalScrollRecommendationAndOthers(){
    return ListView.builder(
      shrinkWrap: true,

        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: controller ,
        itemCount: 5,
        itemBuilder: (context, int index){
          List<dynamic> responseList = albumFile;
          List<Widget> listItems =[];
          responseList.forEach((post) {
            listItems.add(
              GestureDetector(
                  onTap: (){
                    index1 = index;
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                      return AlbumView();
                    }));
                  },
                  child: Container(
                    width: 150,

                    margin: EdgeInsets.only(right: 3.0, top: 10.0, bottom: 10.0),
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          elevation: 10.0,
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage("assets/${post["image"]}"),
                                  fit: BoxFit.fill,
                                )
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                post["albumName"],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                post["artist"],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 10.0,)

                      ],
                    ),
                  )


              ),

            );

          });
          return listItems[index];
        });
  }

  Widget NewHorizons(){
    return ListView.builder(
        shrinkWrap: true,

        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: controller ,
        itemCount: 5,
        itemBuilder: (context, int index){
          List<dynamic> responseList = albumFile;
          List<Widget> listItems =[];
          responseList.forEach((post) {
            listItems.add(
              GestureDetector(
                  onTap: (){
                    index1 = index;
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                      return AlbumView();
                    }));
                  },
                  child: Card(
                    
                    elevation: 5.0,
                    child: Container(
                      width: 150,
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.only(right: 3.0, top: 10.0, bottom: 10.0),
                      child: Column(
                        children: [
                          Container(
                            width: 125,
                            height: 125,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(125),
                                image: DecorationImage(
                                  image: AssetImage("assets/${post["image"]}"),
                                  fit: BoxFit.fill,
                                )
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  post["albumName"],
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  post["artist"],
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  )


              ),

            );

          });
          return listItems[index];
        });
  }

  Widget TopArtist(){
    return ListView.builder(
        shrinkWrap: true,

        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: controller ,
        itemCount: 5,
        itemBuilder: (context, int index){
          List<dynamic> responseList = albumFile;
          List<Widget> listItems =[];
          responseList.forEach((post) {
            listItems.add(
              GestureDetector(
                  onTap: (){
                    index1 = index;
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                      return AlbumView();
                    }));
                  },
                  child: Container(
                    width: 120,

                    margin: EdgeInsets.only(right: 3.0, top: 10.0, bottom: 10.0),
                    child: Column(
                      children: [
                        Card(
                          shape: CircleBorder(),
                          elevation: 10.0,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(120),
                                image: DecorationImage(
                                  image: AssetImage("assets/${post["image"]}"),
                                  fit: BoxFit.fill,
                                )
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                post["artist"],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87, fontFamily: 'Calibri'),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 10.0,)

                      ],
                    ),
                  )


              ),

            );

          });
          return listItems[index];
        });
  }


  void changePageToSearch(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return Search();
    }));
  }

  Icon musicIcon = Icon(Icons.audiotrack);



  Color color = const Color(0xCDFFFFFF);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        index++;
      });
      if(index== albumFile.length){
        setState(() {
          index=0;
        });
      }
    });

  }




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0x97FFFFFF),
      appBar: AppBar(
        title: Text("Zara", style: TextStyle(color: Colors.black,fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          color: Colors.black,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
              return AccountPage();
            }));
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: changePageToSearch,),

        ],
        backgroundColor: Colors.white,
        elevation: 5,
      ),


      //Hita voa manokatra ny homepage

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /*SizedBox(height: 10.0,),
            ///////////////
            Text("What's New Today", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 20.0,),*/
            pubView(),
            
            //////////////
            SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Played", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                GestureDetector(
                  onTap: (){},
                  child: Icon(Icons.av_timer_rounded, size: 35,color: Colors.black54,),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Container(
              width: size.width,
              height: 175,
              child: Column(
                children: [
                  Expanded(child: horizontalScrollRecentPlayed())
                ],
              ),
            ),

            SizedBox(height: 30.0,),
            ////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recommendation", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                GestureDetector(
                  //mipetaka eto mitondra any am liste ny musique populaire rehetra
                    onTap: (){},
                    child: Text("See all", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal,color: Colors.black54, decoration: TextDecoration.underline),)
                ),
              ],
            ),

            SizedBox(height: 20.0,),
            Container(
              width: size.width,
              height:230,
              child: Column(
                children: [
                  Expanded(child: horizontalScrollRecommendationAndOthers())
                ],
              ),
            ),

            SizedBox(height: 30.0,),
            ///////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Top listened", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                GestureDetector(
                  //mipetaka eto mitondra any am liste ny musique populaire rehetra
                  onTap: (){},
                    child: Text("See all", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal,color: Colors.black54, decoration: TextDecoration.underline),)
                ),
              ],
            ),

            SizedBox(height: 20.0,),
            Container(
              height: 235,
              child: topLIstened(),
            ),

            SizedBox(height: 30.0,),
            //////////////////
            //artist/////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Artist Of The Time", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                GestureDetector(
                  //mipetaka eto mitondra any am liste ny musique populaire rehetra
                    onTap: (){},
                    child: Text("See all", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal,color: Colors.black54, decoration: TextDecoration.underline),)
                ),
              ],
            ),

            SizedBox(height: 15.0,),
            Container(
              width: size.width,
              height:180,
              child: Column(
                children: [
                  Expanded(child: TopArtist())
                ],
              ),
            ),
            SizedBox(height: 30.0,),
            ///////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("New Horizons", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),

                GestureDetector(
                  //mipetaka eto mitondra any am liste ny musique populaire rehetra
                    onTap: (){},
                    child: Text("See all", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal,color: Colors.black54, decoration: TextDecoration.underline),)
                ),
              ],
            ),

            SizedBox(height: 20.0,),
            Container(
              width: size.width,
              height:240,
              child: Column(
                children: [
                  Expanded(child: NewHorizons())
                ],
              ),
            ),
          ],

        ),
      )
    );
  }


//music player/////////////////////////////////////////////////


  ///////////////////////////////////////////////////////////////////////////////////

}









