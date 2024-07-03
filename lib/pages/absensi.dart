import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AbsensiPage extends StatefulWidget {
  const AbsensiPage({super.key});

  @override
  State<AbsensiPage> createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  DateTime? _selectedDate;
  String? _attendanceStatus;

  void _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
      });
  }

  Widget _buildMapPlaceholder() {
    return Container(
      height: 200,
      color: Colors.grey[300],
      child: Center(
        child: Text(
          'Map Placeholder',
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Absensi",
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
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () => _pickDate(context),
                            child: Text(
                              _selectedDate == null
                                  ? 'Pilih Tanggal'
                                  : DateFormat.yMd().format(_selectedDate!),
                            ),
                          ),
                          SizedBox(height: 20),
                          _buildMapPlaceholder(),
                          SizedBox(height: 20),
                          Text(
                            'Keterangan:',
                            style: TextStyle(fontSize: 18),
                          ),
                          Column(
                            children: [
                              RadioListTile<String>(
                                title: Text('Sakit'),
                                value: 'Sakit',
                                groupValue: _attendanceStatus,
                                onChanged: (value) {
                                  setState(() {
                                    _attendanceStatus = value;
                                  });
                                },
                              ),
                              RadioListTile<String>(
                                title: Text('Izin'),
                                value: 'Izin',
                                groupValue: _attendanceStatus,
                                onChanged: (value) {
                                  setState(() {
                                    _attendanceStatus = value;
                                  });
                                },
                              ),
                              RadioListTile<String>(
                                title: Text('Terlambat'),
                                value: 'Terlambat',
                                groupValue: _attendanceStatus,
                                onChanged: (value) {
                                  setState(() {
                                    _attendanceStatus = value;
                                  });
                                },
                              ),
                              RadioListTile<String>(
                                title: Text('Alfa'),
                                value: 'Alfa',
                                groupValue: _attendanceStatus,
                                onChanged: (value) {
                                  setState(() {
                                    _attendanceStatus = value;
                                  });
                                },
                              ),
                            ],
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
