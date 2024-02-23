import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('home'),
    Text('home'),
    Text('home'),
    Text('home'),
    Text('home'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottomOpacity: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            statusBarColor: Colors.white,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.05),
            )
          ],
        ),
        child: BottomNavigationBar(
          iconSize: 24,
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF40BFFF),
          unselectedItemColor: const Color(0xFF9098B1),
          showSelectedLabels: true,
          enableFeedback: true,
          onTap: (index)=>setState(() {
            _selectedIndex = index;
          }),
          items:  const [
            // Home button //
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            // Search button //
            BottomNavigationBarItem(icon: Icon(Icons.search_rounded),label: "Explore"),
            // Cart button //
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: "Cart"),
            // Offer button //
            BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined),label: "Offer"),
            // Account button //
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp),label: "Account"),

          ],
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
    );
  }
}