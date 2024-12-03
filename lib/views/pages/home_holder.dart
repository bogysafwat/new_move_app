import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:new_move_app/views/pages/download_page.dart';
import 'package:new_move_app/views/pages/home_page.dart';

import 'me_page.dart';
import 'saved_page.dart';
import 'search_page.dart';

class HomeHolder extends StatefulWidget {

  const HomeHolder({super.key});

  @override
  State<HomeHolder> createState() => _HomeHolderState();
}

class _HomeHolderState extends State<HomeHolder> {
  int _selectedIndex =0;
  final _pages=[HomePage(),SearchPage(),SavedPage(),DownloadPage(),MePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070420),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
         backgroundColor: const Color(0xFF25233D)
        ,
          currentIndex: _selectedIndex,
        onTap: (index){
            setState(() {
              _selectedIndex=index;
            });
        },
        selectedItemColor: Colors.white, // Color for selected items
        unselectedItemColor: Colors.grey, // Color for unselected items
        showSelectedLabels: true, // Show labels for selected items
        showUnselectedLabels: true, // Hide labels for unselected items
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon:Icon( IconlyLight.home),label: 'home'),
          BottomNavigationBarItem(icon:Icon( IconlyLight.search),label: 'Search'),
          BottomNavigationBarItem(icon:Image.asset('lib/assets/bookmark.png'),label: 'Saved'),
          BottomNavigationBarItem(icon:Image.asset('lib/assets/arrow.png'),label: 'Download'),
          BottomNavigationBarItem(icon:Icon(Icons.person_2_outlined),label: 'Me'),
        ],
      ),
    );
  }
}
