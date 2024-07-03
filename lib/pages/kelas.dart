import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_siak/host.dart';
import 'package:http/http.dart' as http;

class KelasPage extends StatefulWidget {
  const KelasPage({super.key});

  @override
  State<KelasPage> createState() => _KelasPageState();
}

class _KelasPageState extends State<KelasPage> {
  List kelas = [];
  // List<Map<String, dynamic>> jurusan = [];

  Future<void> getDataKelas() async {
    String urlKelas = "${gate}/api/kelasApi";

    try {
      // Fetch data guru
      var responseKelas = await http.get(Uri.parse(urlKelas));
      if (responseKelas.statusCode == 200) {
        kelas = jsonDecode(responseKelas.body);
      } else {
        print('Gagal memuat data Kelas');
      }
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  // Future<void> getDataJurusan() async {
  //   String urlKelas = "${gate}/api/jurusanApi";

  //   try {
  //     // Fetch data guru
  //     var responseJurusan = await http.get(Uri.parse(urlKelas));
  //     if (responseJurusan.statusCode == 200) {
  //       kelas = jsonDecode(responseJurusan.body);
  //     } else {
  //       print('Gagal memuat data Kelas');
  //     }
  //     setState(() {});
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getDataKelas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Kelas',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: kelas.isEmpty
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
                      itemCount: kelas.length,
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
                              "${kelas[index]["tahun_ajaran"]?.toString() ?? ""} MIPA",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
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
