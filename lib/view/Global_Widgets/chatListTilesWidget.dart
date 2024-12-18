import 'package:flutter/material.dart';
import 'package:talkiee_app/utils/constants/color_constants.dart';

class chatListTilesWidget extends StatelessWidget {
  chatListTilesWidget({
    required this.imageUrl,
    required this.name,
    this.Message = "",
    this.time = "",
    required this.isOnline,
    this.unreadCount = 0,
    super.key,
  });
  String imageUrl;
  String name;
  String Message;
  String time;
  bool isOnline;
  int? unreadCount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl, // Replace with your network image URL
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          isOnline
              ? Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              : Text("")
        ],
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(Message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 4),
          unreadCount != 0
              ? CircleAvatar(
                  radius: 12,
                  backgroundColor: ColorConstants.lightblue,
                  child: Text(
                    unreadCount.toString(),
                    style: TextStyle(fontSize: 12, color: ColorConstants.white),
                  ))
              : Text(""),
        ],
      ),
    );
  }
}
