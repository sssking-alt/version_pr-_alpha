import 'dart:ui';

import 'package:flutter/material.dart';
import 'homepage.dart';
import 'fileData.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class MusicPLayer extends StatefulWidget {
  @override
  _MusicPLayerState createState() => _MusicPLayerState();
}

class _MusicPLayerState extends State<MusicPLayer> {

  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;
  int timeProgress = 0;
  int audioDuration = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState = s;
      });

    });


    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inMilliseconds;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        timeProgress = p.inMilliseconds;
      });
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
  }

  String path = albumFile[index1]["song"];
  playMusic() async {
    await audioCache.play(path);
  }

  pauseMusic() async{
    await audioPlayer.pause();
  }

  Widget slider (){
    return Container(
      margin: EdgeInsets.all(0),
      child: Slider(value: (timeProgress/1000).floorToDouble(),
          max: (audioDuration/1000).floorToDouble(),
          activeColor: Color(0xDCFFFFFF),
          onChanged: (value){
            seekToSec(value.toInt());
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration:BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/${albumFile[index1]["image"]}"),
          fit: BoxFit.cover
        )
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 40.0, sigmaX: 40.0),
        child: Column(
          children: [
            Stack(

              children: [

                Container(
                  height: MediaQuery.of(context).size.height/1.7,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                ),
                ClipPath(
                  clipper: MusicClipper(),

                  child:
                  Container(
                    height: MediaQuery.of(context).size.height/1.7,
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:  AssetImage("assets/${albumFile[index1]["image"]}"),
                            fit: BoxFit.cover
                        )
                    ),

                  ),
                ),
                /* BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                  child: Container(
                    color: Colors.white.withOpacity(0.1),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),*/
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            GestureDetector(
                              child: Icon(Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 30,
                              ),
                              onTap: (){
                                Navigator.pop(context);
                              },
                            ),
                            GestureDetector(
                              child: Row(
                                children: [



                                  SizedBox(width: 10.0,),

                                  Icon(Icons.equalizer,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ],
                              ),
                              onTap: null,
                            ),


                          ],
                        ),
                      ),


                      /*Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/25),
                        width: 230,
                        height: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(230),
                          image: DecorationImage(
                            image: AssetImage("assets/${albumFile[index]["image"]}"),
                          )
                        )
                      ),*/
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              margin: EdgeInsets.only(left: 5.0, right: 5.0),
                              child: Row(
                                children: [


                                  SizedBox(width: 10.0,),


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),




                    ],
                  ),
                ),

              ],
            ),


////misy an le boutton lecteur
            Container(
              color: Colors.transparent,
              height: (MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height/1.7)),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 40, left: 5.0, right: 5.0, bottom: 5.0),
              child: Column(
                children: [

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //bouton add to playlist/////////////////////////////////////////////
                        Container(
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: GestureDetector(
                            child: Icon(Icons.download_sharp,
                              color: Color(0xDCFFFFFF),
                              size: 30,
                            ),
                            onTap: (){
                              Navigator.pop(context);
                            },
                          ),
                        ),

                        //nom album et artist/////////////////////////////////

                        Container(
                          width: MediaQuery.of(context).size.width-120,
                          child: Column(
                            children: [
                              Container(

                                child: Text(
                                  albumFile[index1]["albumName"],
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color:Color(0xDCFFFFFF),
                                      decoration: TextDecoration.none,
                                    fontFamily: 'Calibri Corps'
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0, left: 10, right: 10),
                                child: Text(
                                  albumFile[index1]["artist"],
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Calibri Corps'
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                        //bouton etoile///////////////////////////////
                        GestureDetector(
                          child: Icon(Icons.star_border,
                            color: Color(0xDCFFFFFF),
                            size: 30,
                          ),
                          onTap: null,
                        ),
                      ],
                    ),
                  ),

                  //bouton an ny lecteur//////////////////////////////////////

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //access album
                      GestureDetector(
                        child: Icon(Icons.album,
                          color: Color(0xDCFFFFFF),
                          size: 30,
                        ),
                        onTap: null,
                      ),

                      SizedBox(width: 10.0,),
                      //loop///////

                      SizedBox(width: 20.0,),

                      //previous/////

                      GestureDetector(
                        child: Icon(Icons.skip_previous,
                          color: Color(0xDCFFFFFF),
                          size: 40,
                        ),
                        onTap: (){
                          pauseMusic();
                          setState(() {
                            timeProgress = 0;
                          });
                          setState(() {
                            audioDuration = 0;
                          });
                          setState(() {
                            index1 --;
                          });
                          if(index1 <0 ){
                            setState(() {
                              index1 = albumFile.length - 1;
                            });
                          }
                          setState(() {
                            path = albumFile[index1]["song"];
                          });
                        },
                      ),

                      //pause et play//////
                      GestureDetector(
                        child: Icon((audioPlayerState != AudioPlayerState.PLAYING)? Icons.play_arrow : Icons.pause,
                          color: Color(0xDCFFFFFF),
                          size: 80,
                        ),
                        onTap: (){
                          (audioPlayerState != AudioPlayerState.PLAYING)? playMusic() : pauseMusic();
                        },
                      ),

                      //next////////////////////////////
                      GestureDetector(
                        child: Icon(Icons.skip_next,
                          color: Color(0xDCFFFFFF),
                          size: 40,
                        ),
                        onTap: (){
                          pauseMusic();
                          setState(() {
                            timeProgress = 0;
                          });
                          setState(() {
                            audioDuration = 0;
                          });
                          setState(() {
                            index1 ++;
                          });
                          if(index1  == albumFile.length){
                            setState(() {
                              index1 = 0;
                            });
                          }
                          setState(() {
                            path = albumFile[index1]["song"];
                          });
                        },
                      ),
                      SizedBox(width: 20.0,),

                      //random/////////////////////////////
                      GestureDetector(
                        child: Icon(Icons.shuffle,
                          color: Color(0xDCFFFFFF),
                          size: 25,
                        ),
                        onTap: (){},
                      ),
                      SizedBox(width: 10.0,),

                      //download/////////////////////


                    ],
                  ),

                  //durée
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(getTimeString(timeProgress), style: TextStyle(fontSize: 12, color: Color(0xDCFFFFFF), fontWeight: FontWeight.normal, decoration: TextDecoration.none),),
                      Text(getTimeString(audioDuration),style: TextStyle(fontSize: 12, color: Color(0xDCFFFFFF), fontWeight: FontWeight.normal, decoration: TextDecoration.none),)

                    ],
                  ),

                  //slider///////////////////
                  Card(
                    color:Colors.transparent,
                    elevation: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: slider(),
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(0),
                    ),
                  )

                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
//methode manova an le soratra eo am le slider
String  getTimeString(int milliseconds) {
    String minutes = "${(milliseconds / 60000).floor() < 10 ? 0 :""}${(milliseconds / 60000).floor()}";
    String seconds = "${(milliseconds / 1000).floor() % 60 < 10 ? 0 : ""}${(milliseconds / 1000).floor() % 60}";

    return '$minutes:$seconds';
}

  void seekToSec(int sec){

    Duration newPosition = Duration(seconds: sec);
    setState(() {
      audioPlayer.seek(newPosition);
    });

  }
}




class MusicClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height-50);
    path.quadraticBezierTo(size.width/4, size.height, size.width/2, size.height);
    path.quadraticBezierTo(size.width-(size.width/4), size.height, size.width, size.height-50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}



