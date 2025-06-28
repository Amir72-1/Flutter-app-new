import 'package:flutter/material.dart';
import 'package:first_app/constants.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const CustomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: Constants.secondary,
      height: 60,
      backgroundColor: Constants.secondary,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: [
        NavigationDestination(
          icon: Image.asset(
            'assets/icons/house_home.webp',
            height: 35,
            width: 35,
          ),
          label: 'Home',
          selectedIcon: Image.asset(
            'assets/icons/homeSelcted.png',
            color: Constants.primary,
            height: 35,
            width: 35,
          ),
        ),
        NavigationDestination(
          icon: Image.asset('assets/icons/bookmark.png', height: 30, width: 30),
          selectedIcon: Image.asset(
            'assets/icons/bookmark Selected.png',
            color: Constants.primary,
            height: 35,
            width: 35,
          ),
          label: 'Bookmark',
        ),
        NavigationDestination(
          icon: Image.asset('assets/icons/history.png', height: 30, width: 30),
          selectedIcon: Image.asset(
            'assets/icons/historyselected.png',
            color: Constants.primary,
            height: 35,
            width: 35,
          ),
          label: 'History',
        ),
        NavigationDestination(
          icon: Image.asset('assets/icons/profile.png', height: 30, width: 30),
          selectedIcon: Image.asset(
            'assets/icons/userselected.png',
            color: Constants.primary,
            height: 35,
            width: 35,
          ),
          label: 'Me',
        ),
      ],
    );
  }
}