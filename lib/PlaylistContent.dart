import 'dart:ui';

import 'package:flutter/material.dart';

class playlistContent extends StatefulWidget {
  @override
  _playlistContentState createState() => _playlistContentState();
}

class _playlistContentState extends State<playlistContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x97FFFFFF),
        body: TextButton.icon(
          //mbola mila configurena
            onPressed: null,
            icon: Icon(Icons.add_box_outlined),
            label: Text("Create a playlist", style: TextStyle(color: Colors.black,fontSize: 20.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
        ),
    );
  }
}


