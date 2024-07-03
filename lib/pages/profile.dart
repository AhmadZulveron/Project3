import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Profil Saya",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))
                    ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                    ),
                    Text("ahmad", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Expanded(
                      child: ListView(
                        children: [
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text('Profile'),
                            onTap: () {
                              // Handle profile tap
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('Settings'),
                            onTap: () {
                              // Handle settings tap
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.notifications),
                            title: Text('Notifications'),
                            onTap: () {
                              // Handle notifications tap
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.help),
                            title: Text('Help'),
                            onTap: () {
                              // Handle help tap
                            },
                          ),
                          Divider(), // Divider to separate logout from other menu items
                          ListTile(
                            leading: Icon(Icons.logout, color: Colors.red,),
                            title: Text('Logout'),
                            onTap: () {
                              // Handle logout tap
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
