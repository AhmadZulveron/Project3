import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_siak/host.dart';

class GuruPage extends StatefulWidget {
  const GuruPage({super.key});

  @override
  State<GuruPage> createState() => _GuruPageState();
}

class _GuruPageState extends State<GuruPage> {
  List gurus = [];
  String baseUrl = "${gate}/foto/guru/";

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  Future<void> getDataGuru() async {
    String urlGuru = "${gate}/api/guruApi";

    try {
      // Fetch data guru
      var responseGuru = await http.get(Uri.parse(urlGuru));
      if (responseGuru.statusCode == 200) {
        gurus = jsonDecode(responseGuru.body);
      } else {
        print('Gagal memuat data Guru');
      }
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getDataGuru();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      appBar: AppBar(
        centerTitle: true,
        title: !isSearching
            ? Text(
                'Guru',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            : TextField(
                controller: searchController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.teal[600],
                  hintText: "Cari guru..",
                  hintStyle: TextStyle(color: Colors.white38),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
                onChanged: (value) {
                  // Logic search disini
                },
              ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search, color: Colors.white,),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) {
                  searchController.clear();
                  getDataGuru();
                }
              });
            },
          ),
        ],
      ),
      body: gurus.isEmpty
          ? Column(
            children: [
              SizedBox(height: 20,),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    ),
                    color: Colors.white
                  ),
                  child: Center(
                    child: LoadingAnimationWidget.stretchedDots(color: Colors.teal.shade200, size: 54),
                  ),
                ),
              ),
            ],
          )
          : SafeArea(
              child: Column(
              children: [
                SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                            color: Colors.white
                    ),
                    child: ListView.builder(
                      itemCount: gurus.length,
                      itemBuilder: (context, index) {
                        String photoFileName = gurus[index]["photo"];
                        String photoUrl = baseUrl + photoFileName;

                        return Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(5),
                          child: ListTile(
                            leading: Image.network(
                              photoUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              gurus[index]["nama"]?.toString() ?? "",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Status : ${gurus[index]["status_pegawai"]?.toString() ?? ""}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 183, 184, 189),
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        );
                      },
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                ),
              ],
            )
          ),
    );
  }
}
