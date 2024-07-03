import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_siak/host.dart';

class JadwalPelajaran extends StatefulWidget {
  const JadwalPelajaran({super.key});

  @override
  State<JadwalPelajaran> createState() => _JadwalPelajaranState();
}

class _JadwalPelajaranState extends State<JadwalPelajaran> {
  List jadwals = [];
  List<Map<String, dynamic>> judulMapel = [];

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  Future<void> getData() async {
    String urlJadwal = "${gate}/api/jadwalApi";

    try {
      // Fetch data jadwal
      var responseJadwal = await http.get(Uri.parse(urlJadwal));
      if (responseJadwal.statusCode == 200) {
        jadwals = jsonDecode(responseJadwal.body);
      } else {
        print('Gagal memuat data jadwal');
      }

      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMapel() async {
    String urlMapel = "${gate}/api/mapelApi";
    try {
      var response = await http.get(Uri.parse(urlMapel));
      final List<dynamic> dataMapel = jsonDecode(response.body);
      setState(() {
        judulMapel = List.from(dataMapel);
      });
    } catch (exc) {
      print(exc);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    getMapel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      appBar: AppBar(
        centerTitle: true,
        title: !isSearching
            ? Text(
                'Jadwal Pelajaran',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            : TextField(
                controller: searchController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.teal[600],
                  hintText: "Cari jadwal..",
                  hintStyle: TextStyle(color: Colors.white38),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
                onChanged: (value) {
                  // Implement your search logic here
                },
              ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        actions: [
          IconButton(
            icon: Icon(
              isSearching ? Icons.close : Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) {
                  searchController.clear();
                  getData();
                }
              });
            },
          ),
        ],
      ),
      body: jadwals.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white),
                    child: Center(
                      child: LoadingAnimationWidget.stretchedDots(
                          color: Colors.teal.shade200, size: 54),
                    ),
                  ),
                ),
              ],
            )
          : SafeArea(
              child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white),
                    child: ListView.builder(
                      itemCount: jadwals.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(5),
                          child: ListTile(
                            leading: Icon(
                              Icons.book_outlined,
                              color: Colors.green.shade500,
                              size: 24,
                            ),
                            title: Text(
                              // jadwals[index]["id_mata_pelajaran"]?.toString() ?? "",
                              "${judulMapel.firstWhere((mata_pelajarans) => mata_pelajarans["mata_pelajaran_id"] == jadwals[index]["id_mata_pelajaran"], orElse: () => {})["judul"] ?? ""}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Jam ke : ${jadwals[index]["waktu_mengajar"]?.toString() ?? ""}",
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
            )),
    );
  }
}
