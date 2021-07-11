import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localStorageServiceProvider = Provider<LocalStorageService>(
  (ref) => throw UnimplementedError(),
);

enum BoxName {
  auth,
}

class LocalStorageService {
  bool initialized = false;
  final boxes = <BoxName, Box<Map<String, dynamic>>>{};

  LocalStorageService();

  Future<void> init() async {
    await Hive.initFlutter();
    for (final boxName in BoxName.values) {
      final box = await Hive.openBox<Map<String, dynamic>>(boxName.toString());
      boxes.putIfAbsent(boxName, () => box);
    }
    initialized = true;
  }

  Future<void> put(
      BoxName boxName, String key, Map<String, dynamic> value) async {
    await boxes[boxName]!.put(key, value);
  }

  Map<String, dynamic>? get(BoxName boxName, String key) {
    return boxes[boxName]!.get(key);
  }

  void delete(BoxName boxName, String key) {
    boxes[boxName]!.delete(key);
  }
}
