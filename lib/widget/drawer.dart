import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 228,
            width: double.infinity,
            decoration:const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.deepOrange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50), // Add some space at the top
                CircleAvatar(
                  backgroundImage: AssetImage("assets/profile.png"),
                  radius: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "Khan Meraj",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "khanmeraj1542005@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16), // Add some space at the bottom
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                createDrawerItem(
                  icon: Icons.home,
                  text: 'Home',
                  onTap: () {
                    Navigator.of(context).pushNamed('home-screen');
                  },
                ),
                createDrawerItem(
                  icon: Icons.shopping_cart,
                  text: 'My Cart',
                  onTap: () {
                    Navigator.of(context).pushNamed('add-card-screen');
                  },
                ),
                createDrawerItem(
                  icon: Icons.history,
                  text: 'Order History',
                  onTap: () {
                    Navigator.of(context).pushNamed('/order-history');
                  },
                ),
                createDrawerItem(
                  icon: Icons.person,
                  text: 'Profile',
                  onTap: () {
                    Navigator.of(context).pushNamed('/profile');
                  },
                ),
                createDrawerItem(
                  icon: Icons.settings,
                  text: 'Settings',
                  onTap: () {
                    Navigator.of(context).pushNamed('/settings');
                  },
                ),
                const Divider(),
                createDrawerItem(
                  icon: Icons.help,
                  text: 'Help & Support',
                  onTap: () {
                    Navigator.of(context).pushNamed('/help-support');
                  },
                ),
                createDrawerItem(
                  icon: Icons.logout,
                  text: 'Logout',
                  onTap: () {
                    Navigator.of(context).pushNamed('/');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createDrawerItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}
