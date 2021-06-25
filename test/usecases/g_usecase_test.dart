import 'package:flutter_test/flutter_test.dart';
import 'package:g_core/src/domain/entities/g_entity.dart';
import 'package:g_core/src/domain/repositories/g_repository.dart';
import 'package:g_core/src/domain/usecases/g_usecase.dart';
import 'package:mockito/mockito.dart';

import '../utils/default_test_observer.dart';

class Repository extends Mock implements IRepository {}

void main() {
  Repository repository;
  GetAllUsecase usecase;
  DefaultTestObserver<List<Entity>> observer;

  setUp(() {
    repository = Repository();
    usecase = GetAllUsecase(repository);
    observer = DefaultTestObserver<List<Entity>>();
  });

  test('get all', () async {
    when(repository.getAll()).thenAnswer((_) async => <Entity>[]);

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