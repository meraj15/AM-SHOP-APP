import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Khan Meraj",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            accountEmail: Text(
              "khanmeraj1542005@gmail.com",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/profile.png"),
              radius: 30.0,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.deepOrange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _createDrawerItem(
                  icon: Icons.home,
                  text: 'Home',
                  onTap: () => Navigator.of(context).pop(),
                ),
                _createDrawerItem(
                  icon: Icons.person,
                  text: 'Profile',
                  onTap: () => Navigator.of(context).pop(),
                ),
                _createDrawerItem(
                  icon: Icons.settings,
                  text: 'Settings',
                  onTap: () => Navigator.of(context).pop(),
                ),
                _createDrawerItem(
                  icon: Icons.notifications,
                  text: 'Notifications',
                  onTap: () => Navigator.of(context).pop(),
                ),
                Divider(),
                _createDrawerItem(
                  icon: Icons.help,
                  text: 'Help & Support',
                  onTap: () => Navigator.of(context).pop(),
                ),
                _createDrawerItem(
                  icon: Icons.logout,
                  text: 'Logout',
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    GestureTapCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}
