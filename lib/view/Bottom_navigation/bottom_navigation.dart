import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talkiee_app/utils/constants/color_constants.dart';
import 'package:talkiee_app/view/Calls_Screen/calls_screen.dart';
import 'package:talkiee_app/view/Chat_Screen/chat_screen.dart';
import 'package:talkiee_app/view/Me_Screen/me_screen.dart';

// Defining Stateprovider ::: Default value to selected index given to 1
final selectedIndexProvider = StateProvider<int>((ref) => 1);

class AppBottomNavigation extends ConsumerWidget {
  const AppBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch selectedIndexProvider for getting current Index
    final selectedIndex = ref.watch(selectedIndexProvider);

    // List for Body Screens
    final List<Widget> screens = [CallsScreen(), ChatScreen(), MeScreen()];
    return Scaffold(
      extendBody: true, //transparent body change

      body: Stack(children: [
        screens[selectedIndex],
        Positioned(
          bottom: 0,
          child: AnimatedNotchBottomBar(
            color: const Color.fromRGBO(255, 255, 255, 1),
            kBottomRadius: 28,
            kIconSize: 24,
            notchBottomBarController:
                NotchBottomBarController(index: selectedIndex),
            bottomBarItems: [
              const BottomBarItem(
                inActiveItem: Icon(
                  Icons.phone_in_talk_outlined,
                  color: ColorConstants.blueGrey,
                ),
                activeItem: Icon(
                  Icons.phone_in_talk_rounded,
                  color: Colors.green,
                ),
                itemLabel: 'Call',
              ),
              const BottomBarItem(
                inActiveItem: Icon(
                  Icons.chat_bubble_outline_outlined,
                  color: ColorConstants.blueGrey,
                ),
                activeItem: Icon(
                  Icons.chat,
                  color: Colors.blueAccent,
                ),
                itemLabel: 'Chats',
              ),

              ///svg item
              BottomBarItem(
                inActiveItem: Icon(
                  Icons.face_unlock_outlined,
                  color: ColorConstants.blueGrey,
                ),
                activeItem: Icon(
                  Icons.face_sharp,
                  color: ColorConstants.yellow,
                ),
                itemLabel: 'Me',
              ),
            ],
            onTap: (value) {
              // updating the selected index value
              ref.read(selectedIndexProvider.notifier).state = value;
            },
          ),
        )
      ]),
    );
  }
}
