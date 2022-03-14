import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aunjai/views/home/home.dart';

class AppHomeNavigation extends StatefulWidget {
  const AppHomeNavigation({Key? key}) : super(key: key);

  @override
  _AppHomeNavigationState createState() => _AppHomeNavigationState();
}

class _AppHomeNavigationState extends State<AppHomeNavigation> {
  final List<Widget> _screens = [
    const Home(),
    const Home(),
    const Home(),
  ];
  late int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: customeAppbar(),
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          // backgroundColor: kGrayColor,
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          // unselectedItemColor: kDisable,
          // selectedLabelStyle: getFontStyle(fontSize: 12.0),
          // unselectedLabelStyle: getFontStyle(fontSize: 12.0)
          // ,
          items: const [
            BottomNavigationBarItem(
                activeIcon: FaIcon(
                  FontAwesomeIcons.solidCompass,
                  size: 18,
                ),
                icon: FaIcon(
                  FontAwesomeIcons.compass,
                  size: 18,
                ),
                label: "explorer"),
            BottomNavigationBarItem(
                activeIcon: FaIcon(
                  FontAwesomeIcons.solidCompass,
                  size: 18,
                ),
                icon: FaIcon(
                  FontAwesomeIcons.compass,
                  size: 18,
                ),
                label: "Trip Me"),
            BottomNavigationBarItem(
                activeIcon: FaIcon(
                  FontAwesomeIcons.solidCompass,
                  size: 18,
                ),
                icon: FaIcon(
                  FontAwesomeIcons.compass,
                  size: 18,
                ),
                label: "Profile"),
          ],
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped),
    );
  }
}
