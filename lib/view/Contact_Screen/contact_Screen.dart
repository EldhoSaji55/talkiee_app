import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talkiee_app/dummy_db.dart';
import 'package:talkiee_app/utils/constants/color_constants.dart';
import 'package:talkiee_app/view/Chat_Screen/searchBoxWidget.dart';
import 'package:talkiee_app/view/Global_Widgets/appbarWidget.dart';
import 'package:talkiee_app/view/Global_Widgets/chatListTilesWidget.dart';

class ContactScreen extends ConsumerWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Appbarwidget(
              title: "Contacts",
              isContact: true,
            ),
            // searchBoxWidget(),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: DummyDb.chatData.length,
              itemBuilder: (context, index) => chatListTilesWidget(
                imageUrl: DummyDb.chatData[index]["imageUrl"],
                name: DummyDb.chatData[index]["name"],
                isOnline: DummyDb.chatData[index]["isOnline"],
                unreadCount: DummyDb.chatData[index]["unreadCount"],
              ),
              separatorBuilder: (context, index) => Text(""),
            )
          ],
        ),
      ),
    );
  }
}
