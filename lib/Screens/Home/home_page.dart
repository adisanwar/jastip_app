import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:jastip_app/Screens/Cart/cart.dart';
import 'package:jastip_app/Screens/Activity/activity.dart';
import 'package:jastip_app/Screens/Home/main_screen.dart';
import 'package:jastip_app/Screens/Profile/profile.dart';
import 'package:jastip_app/Styles/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Track the selected tab
  final PageController _pageController = PageController();

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const <Widget>[
          // Add your respective page widgets here
          MainScreen(),
          ActivityScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        onItemSelected: _onTap,
        items: [
          BottomNavyBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(left: 9), // Atur padding vertikal
              child: Icon(Icons.home),
            ),
            title: const Text('Beranda'),
            activeColor: primaryColor,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.notes),
            title: const Text('Aktivitas'),
            activeColor: primaryColor,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.trolley),
            title: const Text('Keranjang'),
            activeColor: primaryColor,
          ),
          BottomNavyBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(right: 9),
              child: Icon(Icons.person),
            ),
            title: const Text('Profil'),
            activeColor: primaryColor,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
