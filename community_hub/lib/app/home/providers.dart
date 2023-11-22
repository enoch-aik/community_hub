import 'package:hooks_riverpod/hooks_riverpod.dart';

final clientSelectedIndexProvider = StateProvider<int>((ref) => 0);

//true if client, false if worker
final userTypeProvider = StateProvider<bool>((ref) => true);
