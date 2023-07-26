import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/screen/homescreen.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Text("Search"),
    const Text("Tickets"),
    const Text("Profile")
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 30,
              offset: const Offset(0, 20),
            )
          ],
        ),
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, //to stop movement of the icon
            currentIndex:
                _selectedIndex, //telling the flutter on which index we should have been right now
            onTap: _onItemTapped, //what would happen on tap
            elevation: 10,
            showSelectedLabels: false, //hiding text
            showUnselectedLabels: false, //hiding text
            selectedItemColor:
                Colors.blueGrey, //what would be the color of selectedItem
            unselectedItemColor: const Color(
                0xFF526480), //what would be the color of unselectedItem
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              ),
              BottomNavigationBarItem(
                label: "Search",
                icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              ),
              BottomNavigationBarItem(
                label: "Tickets",
                icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
