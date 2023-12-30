import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:storage_utility/storage_utility.dart' as storage;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NumberFormat _format = NumberFormat.decimalPattern();
  int? _totalBytes;
  int? _freeBytes;

  Future<void> getTotalBytes() async {
    storage
        .getTotalBytes()
        .then((value) => setState(() => _totalBytes = value));
  }

  void getFreeBytes() {
    storage.getFreeBytes().then((value) => setState(() => _freeBytes = value));
  }

  @override
  void initState() {
    super.initState();
    getTotalBytes();
    getFreeBytes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Storage Utility Example App'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 32),
            Text('Total Bytes: ${_format.format(_totalBytes ?? 0)} bytes'),
            Text(
              '(${storage.formatBytes(_totalBytes ?? 0)})',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text('Free Bytes: ${_format.format(_freeBytes ?? 0)} bytes'),
            Text(
              '(${storage.formatBytes(_freeBytes ?? 0)})',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: getTotalBytes,
                    child: const Text('getTotalBytes')),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: getFreeBytes,
                  child: const Text('getFreeBytes'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
