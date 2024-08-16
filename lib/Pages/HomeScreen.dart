import 'package:corail_clone/Pages/Home/Home.dart';
import 'package:corail_clone/Pages/Profile/Profile.dart';
import 'package:corail_clone/Pages/Receipt/Receipts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final PageController controller = PageController();
  int _currentIndex = 0;

  void updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void changePage(int index) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: PageView(
        controller: controller,
        onPageChanged: updateIndex,
        children: [
          const Home(),
          const Center(child: Text('Rewards')),
          const Receipts(),
          Profile(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF036086),
          mini: true,
          shape: const CircleBorder(),
          onPressed: () {},
          child: const Icon(Icons.qr_code_scanner_sharp, color: Colors.white,),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xFF036086),
        currentIndex: _currentIndex,
        onTap: (index) {
          changePage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey,),
            activeIcon: Icon(Icons.home, color: Color(0xFF036086),),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined, color: Colors.grey),
            activeIcon: Icon(Icons.list_alt_outlined, color: Color(0xFF036086),),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt, color: Colors.grey),
            activeIcon: Icon(Icons.receipt, color: Color(0xFF036086),),
            label: 'Receipt'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey,),
            activeIcon: Icon(Icons.person, color: Color(0xFF036086),),
            label: 'Profile'
          ),
        ] 
      ), 

    );
  }
}