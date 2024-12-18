import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talkiee_app/view/Global_Widgets/appbarWidget.dart';

class CallsScreen extends ConsumerWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Appbarwidget(title: "Calls"),
          ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            ),
            title: Text("John Doe"),
            subtitle: Row(
              children: [
                Text("2024-12-13"),
                SizedBox(
                  width: 15,
                ),
                Text("10:30PM")
              ],
            ),
            trailing: Icon(Icons.phone_callback_outlined),
          ),
        ],
      ),
    );
  }
}
