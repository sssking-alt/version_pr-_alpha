import 'package:flutter/material.dart';
import 'Storage.dart';
import 'e-mailConnexion.dart';
class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

//variable anaovana paoziny fotsiny ireto fa info tokony avy any anaty base de données
  String accountImage = "assets/taylorSwift.jpeg";
  String userName = "ListenerInfinite";


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(0xF7FFFFFF),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.black87, size: 30.0,),
                  )
                ],
              ),
            ),

            //sary sy anarana
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5.0,
                    shape: CircleBorder(),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(accountImage),
                          fit: BoxFit.cover
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                      height: 70,
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      alignment: Alignment.center,
                      child: Text(userName, style: TextStyle(color: Colors.black54, fontSize: 25.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,)
                  ),

                  //type de connexion
                    Container(
                      width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Connect with", style: TextStyle(color: Colors.green, fontSize: 20.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,),
                            SizedBox(height: 10.0,),
                            GestureDetector(
                              //makany am page connex e mail
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                  return Email();
                                }));
                              },
                                child: Text("E-mail", style: TextStyle(color: Color(0xF71C1A1A), fontSize: 15.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,)
                            ),
                            SizedBox(height: 5.0,),
                            GestureDetector(
                              //makany am page connex facebook
                              onTap: (){},
                                child: Text("Facebook", style: TextStyle(color: Color(0xF71C1A1A), fontSize: 15.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,)
                            ),

                          ],
                        )
                    ),
                  GestureDetector(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Equalizer", style: TextStyle(color: Colors.green, fontSize: 20.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,),
                            SizedBox(height: 5.0,),
                            Text("Go to equalizer settings", style: TextStyle(color: Color(0xF71C1A1A), fontSize: 13.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,)
                          ],
                        )
                    ),
                  ),
                   Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: 15.0, top: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("About", style: TextStyle(color:  Colors.green, fontSize: 20.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,),
                        ],
                      )
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Version", style: TextStyle(color: Color(0xD33B3A3A), fontSize: 15.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,),
                          SizedBox(height: 5.0,),
                          Text("pré-alpha", style: TextStyle(color: Color(0xF71C1A1A), fontSize: 13.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,)
                        ],
                      )
                  ),

                  //liste logicielsutilisés pour conception
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Used softwares", style: TextStyle(color: Color(0xD33B3A3A), fontSize: 15.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,),
                            SizedBox(height: 5.0,),
                            Text("Software used for development", style: TextStyle(color: Color(0xF71C1A1A), fontSize: 13.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,)
                          ],
                        )
                    ),
                  ),

                  //politique confidentialité
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Privacy settings", style: TextStyle(color: Color(
                                0xE83B3A3A), fontSize: 15.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,),
                            SizedBox(height: 5.0,),
                            Text("You should read this, it's important", style: TextStyle(color: Color(0xF71C1A1A), fontSize: 13.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,)
                          ],
                        )
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: 15.0, top: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Other", style: TextStyle(color:  Colors.green, fontSize: 20.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,),
                        ],
                      )
                  ),
//Storage


                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                        return Storage();
                      }));
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Storage", style: TextStyle(color: Color(0xE83B3A3A), fontSize: 15.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,),
                            SizedBox(height: 5.0,),
                            Text("Where do you want to store your music", style: TextStyle(color: Color(0xF71C1A1A), fontSize: 13.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Cooper Black'),overflow: TextOverflow.clip,)
                          ],
                        )
                    ),
                  ),








                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
