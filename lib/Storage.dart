import 'package:flutter/material.dart';
class Storage extends StatefulWidget {
  @override
  _StorageState createState() => _StorageState();
}

class _StorageState extends State<Storage> {
  bool sdCard = false;
  bool intern = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Storage", style: TextStyle(color: Color(0xE83B3A3A),fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
         backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:Color(0x79FFFFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("SD Card", style: TextStyle(color: Colors.black87, fontSize: 20.0, fontFamily: 'Calibri Corps',decoration: TextDecoration.none, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),),
                  Switch(value: (sdCard),
                      activeColor: Colors.green,
                      onChanged: (bool b){
                    if(intern == true){
                      setState(() {
                        b = false;
                      });
                    }
                    setState(() {
                      sdCard = b;
                    });


                  }
                  )

                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Intern Memory", style: TextStyle(color: Colors.black87, fontSize: 20.0, fontFamily: 'Calibri Corps',decoration: TextDecoration.none, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),),
                  Switch(value: (intern),
                      activeColor: Colors.green,
                      onChanged: (bool b){
                    if(sdCard == true){
                      setState(() {
                        b = false;
                      });
                    }
                    setState(() {
                      intern = b;
                    });
                  })

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


