import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talkiee_app/view/Global_Widgets/appbarWidget.dart';

class MeScreen extends ConsumerWidget {
  const MeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Appbarwidget(title: "More"),
            SizedBox(
              height: 16,
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              ),
              title: Text(
                "John Doe",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text("+98765333123"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Account'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to Account settings
                  },
                ),
                ListTile(
                  leading: Icon(Icons.chat),
                  title: Text('Chats'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to Chats settings
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Privacy'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to Privacy settings
                  },
                ),
                ListTile(
                  leading: Icon(Icons.data_usage),
                  title: Text('Data Usage'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to Data Usage settings
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to Help section
                  },
                ),
                ListTile(
                  leading: Icon(Icons.group_add),
                  title: Text('Invite Your Friends'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to Invite Friends section
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
