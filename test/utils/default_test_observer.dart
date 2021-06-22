import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class DefaultTestObserver<T> extends Observer<T> {
  bool ended = false;
  bool done = false;
  bool error = false;
  bool hasData = false;
  T data;
  Exception exception;

  @override
  void onComplete() {
    done = true;
    ended = true;
  }

  @override
  void onError(e) {
    done = false;
    error = true;
    if (e is Exception) {
      exception = e;
    }
    ended = true;
  }

  @override
  void onNext(T response) {
    data = response;
    hasData = true;
  }

  Future<void> awaitUntilEnd() async {
    while (!ended) {
      await Future<dynamic>.delayed(const Duration(seconds: 1));
    }
  }
}
