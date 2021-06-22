import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:g_core/src/domain/entities/g_entity.dart';
import 'package:g_core/src/domain/usecases/g_usecase.dart';

import '../utils/default_test_observer.dart';

void main() {
  GetAllUsecase usecase;
  DefaultTestObserver<List<Entity>> observer;

  setUp(() {
    usecase = GetAllUsecase();
    observer = DefaultTestObserver<List<Entity>>();
  });

  test('get all', () async {
    usecase.execute(observer);
    await observer.awaitUntilEnd();

    expect(observer.ended, true);
    expect(observer.done, true);
    expect(observer.error, false);
    expect(observer.hasData, true);
    expect(observer.data, isA<List<Entity>>());

    usecase.dispose();
  });
}