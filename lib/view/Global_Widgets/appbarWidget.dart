import 'package:flutter/material.dart';

class Appbarwidget extends StatelessWidget {
  Appbarwidget(
      {super.key,
      required this.title,
      this.isContact = false,
      this.isChat = false});
  String title;
  bool isContact;
  bool isChat;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        isContact ? Icon(Icons.add) : Text(""),
        isChat
            ? Row(
                children: [
                  Icon(Icons.camera_alt),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.more_vert)
                ],
              )
            : Text("")
      ],
    );
  }
}
