import 'package:flutter/material.dart';

class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xF0FFFFFF),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
            Center(

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Enter Your E-mail", style: TextStyle(color: Colors.black54, fontSize: 25.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, fontStyle: FontStyle.italic, fontFamily: 'Calibri Corps'),overflow: TextOverflow.clip,),
                 //eto manatsofoka e-mail mbola tsy configuré
                  TextField(
                    decoration: InputDecoration(

                      focusColor: Colors.green,
                      hoverColor: Colors.green,
                      fillColor:Colors.green,
                      hintText: "enter E-mail",
                      labelText: "E-mail",
                    ),
                  ),

                  //password koa mbola tsy configuré
                  TextField(
                    decoration: InputDecoration(
                      focusColor: Colors.green,
                      hoverColor: Colors.green,
                      fillColor:Colors.green,

                      hintText: "enter Password",
                      labelText: "Password",
                    ),
                    obscureText: true,
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
