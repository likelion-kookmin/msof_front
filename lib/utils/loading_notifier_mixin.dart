import 'package:flutter/foundation.dart';

class LoadingNotifierMixin extends ChangeNotifier {
  bool isLoading = false;

  Future<dynamic> whileLoading(Future Function() future) {
    return Future.microtask(toLoading)
        .then((_) => future())
        .whenComplete(toReady);
  }

  void toLoading() {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
  }

  void toReady() {
    if (!isLoading) return;
    isLoading = false;
    notifyListeners();
  }
}
