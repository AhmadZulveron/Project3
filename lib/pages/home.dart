import 'package:flutter/material.dart';
import 'package:mobile_siak/pages/absensi.dart';
import 'package:mobile_siak/pages/guru.dart';
import 'package:mobile_siak/pages/jadwalpelajaran.dart';
import 'package:mobile_siak/pages/jurusan.dart';
import 'package:mobile_siak/pages/kelas.dart';
import 'package:mobile_siak/pages/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0;
  List<Widget> _container = [
    HomePageContent(),
    const AbsensiPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black26,
        color: Colors.white,
        height: 60,
        index: _page,
        items: [
          const Icon(Icons.home_rounded, size: 30,),
          const Icon(Icons.book, size: 30),
          const Icon(Icons.person, size: 30),
        ],
        buttonBackgroundColor: Colors.teal,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _container[_page],
    );
  }
}

class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

class HomePageContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  //Greetings row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Profile pic
                      const Expanded(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person),
                          ),
                          title: Text(
                            "ahmad",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      //Notification
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.teal[600],
                              borderRadius: BorderRadius.circular(50)),
                          padding: const EdgeInsets.all(12),
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //Search bar
                  TextField(
                    autofocus: false,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.teal[600],
                      hintText: "Cari",
                      hintStyle: TextStyle(color: Colors.white30),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white
                ),
                padding: const EdgeInsets.all(25),
                child: Center(
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Menu',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),

                      // Listview menu
                      // Expanded(
                      //   child: GestureDetector(
                      //     onTap: () => ,
                      //   ),
                      // ),

                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JadwalPelajaran()
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 50,
                                      color: Colors.teal,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Jadwal"),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GuruPage()
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person_pin_sharp,
                                      size: 50,
                                      color: Colors.teal,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Guru"),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => KelasPage()
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.meeting_room_sharp,
                                      size: 50,
                                      color: Colors.teal,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Kelas"),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JurusanPage()
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_city_rounded,
                                      size: 50,
                                      color: Colors.teal,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Jurusan"),
                                  ],
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
