import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_siak/host.dart';

class JurusanPage extends StatefulWidget {
  const JurusanPage({super.key});

  @override
  State<JurusanPage> createState() => _JurusanPageState();
}

class _JurusanPageState extends State<JurusanPage> {
  List jurusan = [];

  Future<void> getData() async {
    String urlJurusan = "${gate}/api/jurusanApi";

    try {
      // Fetch data jadwal
      var responseJadwal = await http.get(Uri.parse(urlJurusan));
      if (responseJadwal.statusCode == 200) {
        jurusan = jsonDecode(responseJadwal.body);
      } else {
        print('Gagal memuat data jurusan');
      }

      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text(
                'Jurusan',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
      ),
      body: jurusan.isEmpty
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
                      itemCount: jurusan.length,
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
                              "${jurusan[index]["nama"]?.toString() ?? ""}",
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