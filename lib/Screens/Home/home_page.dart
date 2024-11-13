import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:jastip_app/Screens/Cart/cart.dart';
import 'package:jastip_app/Screens/History/history.dart';
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
          HistoryScreen(),
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
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            activeColor: primaryColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.history),
            title: const Text('History'),
            activeColor: primaryColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.shop),
            title: const Text('Cart'),
            activeColor: primaryColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Users'),
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
