import 'package:storage_utility/storage_utility.dart';

/// Runs example code for README.md.
Future<List<int>> readmeSnippets() async {
  // #docregion Example
  final int freeBytes = await getFreeBytes();

  final int totalBytes = await getTotalBytes();
  // #enddocregion Example

  return <int>[freeBytes, totalBytes];
}
