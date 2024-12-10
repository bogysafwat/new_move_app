import 'package:flutter/material.dart';

import '../../models/movie.dart';
import '../widgets/profile_item.dart';
import 'movie_description.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  get downloadedProvider => null;

  get movieProvider => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF070420),
      body: SafeArea(
          child: Column(
            children: [
              CircleAvatar(

                radius: 50,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Abdelrahman',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'abdelrahman@gmail.com',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 8,),
              ProfileItem(title: 'Privacy', icon: Icons.privacy_tip),
              ProfileItem(title: 'Purchase History', icon: Icons.history),
              ProfileItem(title: 'Help', icon: Icons.help),
              ProfileItem(title: 'Settings', icon: Icons.settings),
              ProfileItem(title: 'Invite a Frinde', icon: Icons.add),
              ProfileItem(title: 'Logout', icon: Icons.logout)
            ],
          )
      ),
    );
  }
}