import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'widgets/fab.dart';
import 'widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../favorite/presentation/views/favorite_view.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../../../settings/presentation/views/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //? This will hold the index of the currently selected tab
  int _selectedIndex = 0;
  final ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(true);
  //? List of screens to display for each tab
  final List<Widget> _screens = [
    const HomeViewBody(),
    const FavoriteView(),
    const ProfileView(),
    const SettingsView(),
  ];

  //? List of icons to display for each tab
  final List<IconData> _icons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.bookmark,
    FontAwesomeIcons.user,
    FontAwesomeIcons.gear,
  ];

  //? Method to handle tab changes
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return PopScope(
      canPop: false, //? Disable the back button from phone
      child: Scaffold(
        floatingActionButton: const Fab(),
        //* To Centering FAB
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //* Display the current screen based on the selected tab
        body: _screens[_selectedIndex],
        //* Bottom Navigation Bar
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: _icons,
          activeIndex: _selectedIndex,
          iconSize: 18,
          gapLocation: GapLocation.center, //? Centering the FAB
          notchSmoothness:
              NotchSmoothness.verySmoothEdge, //? Smooth edge around FAB
          onTap: _onItemTapped,
          splashColor: Colors.grey,
          notchMargin: 8.0,
          backgroundColor: isDarkMode
              ? Colors.black
              : Colors.white, //? Navigation bar background color
          activeColor:
              isDarkMode ? Colors.white : Colors.black, //? Active icon color
          inactiveColor: Colors.grey, //? Inactive icon color
        ),
      ),
    );
  }
}
