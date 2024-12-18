import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talkiee_app/utils/constants/color_constants.dart';

class ChatDetailedScreen extends ConsumerWidget {
  const ChatDetailedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Recipient Name'),
        actions: [
          IconButton(
            icon: Icon(Icons.video_call),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Date Container
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorConstants.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '12 December 2024',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),

                // Recipient Message Bubble
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: ColorConstants.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi there! How are you?',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '12:30 PM',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Sender Message Bubble
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'I am good, thank you!',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '12:32 PM',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[600]),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.done_all,
                                size: 16,
                                color: Colors.blue), // Message Status Icon
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                // TextField with smiley and camera icons
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.emoji_emotions_outlined),
                      labelText: 'Message',
                      suffixIcon: Icon(Icons.camera_alt),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // CircleAvatar for Send Button
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: ColorConstants.green,
                    child: IconButton(
                      icon: Icon(Icons.mic, color: Colors.white),
                      onPressed: () {
                        // Handle send button
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        // Handle send button
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
