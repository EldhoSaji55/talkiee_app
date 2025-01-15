import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talkiee_app/dummy_db.dart';
import 'package:talkiee_app/utils/constants/color_constants.dart';
import 'package:talkiee_app/view/Chat_Screen/searchBoxWidget.dart';
import 'package:talkiee_app/view/Contact_Screen/contact_Screen.dart';
import 'package:talkiee_app/view/Global_Widgets/appbarWidget.dart';
import 'package:talkiee_app/view/Global_Widgets/chatListTilesWidget.dart';
import 'package:talkiee_app/view/chat_detailed_screen.dart/chat_detailed_screen.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: Align(
        alignment: Alignment(1, 0.7),
        child: FloatingActionButton(
          backgroundColor: ColorConstants.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactScreen(),
                ));
          },
          child: Icon(Icons.people_alt_outlined),
        ),
      ),
      body: Column(
        children: [
          Appbarwidget(
            title: "Chat",
            isChat: true,
          ),

          // Status Section
          _StatusSection(),

          Divider(),

          // Search Box
          searchBoxWidget(),

          // Chat List
          _chatListSection(),
        ],
      ),
    ));
  }

  Widget _chatListSection() {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatDetailedScreen(),
                  )),
              child: chatListTilesWidget(
                imageUrl: DummyDb.chatData[index]["imageUrl"],
                name: DummyDb.chatData[index]["name"],
                isOnline: DummyDb.chatData[index]["isOnline"],
                Message: DummyDb.chatData[index]["lastMessage"],
                time: DummyDb.chatData[index]["time"],
                unreadCount: DummyDb.chatData[index]["unreadCount"],
              ));
        },
      ),
    );
  }

  Widget _StatusSection() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: DummyDb.chatData.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 29,
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                        child: Icon(
                          Icons.add,
                          color: ColorConstants.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Your Status',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 29,
                        backgroundImage: NetworkImage(DummyDb.chatData[index][
                            "imageUrl"]), // Replace with your network image URL
                      ),
                      Positioned(
                        top: 2,
                        right: 2,
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.green, // Status indicator color
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    DummyDb.chatData[index]["name"],
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
