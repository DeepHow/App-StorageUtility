import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:storage_utility_platform_interface/storage_utility_platform_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final StorageUtilityPlatform utility = StorageUtilityPlatform.instance;
  final NumberFormat _format = NumberFormat.decimalPattern();

  String? _docPath;
  int? _totalBytes;
  int? _freeBytes;

  void getTotalBytes() {
    utility
        .getTotalBytes(path: _docPath!)
        .then((value) => setState(() => _totalBytes = value));
  }

  void getFreeBytes() {
    utility
        .getFreeBytes(path: _docPath!)
        .then((value) => setState(() => _freeBytes = value));
  }

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((value) {
      setState(() {
        _docPath = value.path;
      });
      getTotalBytes();
      getFreeBytes();
    });
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
            const SizedBox(height: 16),
            Text('Free Bytes: ${_format.format(_freeBytes ?? 0)} bytes'),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _docPath == null ? null : getTotalBytes,
                    child: const Text('getTotalBytes')),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _docPath == null ? null : getFreeBytes,
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
