// storage_utility_windows is implemented using FFI; export a stub for platforms
// that don't support FFI (e.g., web) to avoid having transitive dependencies
// break web compilation.
export 'src/storage_utility_windows_stub.dart'
    if (dart.library.ffi) 'src/storage_utility_windows_real.dart';
