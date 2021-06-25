import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:g_core/src/domain/entities/g_entity.dart';
import 'package:g_core/src/domain/repositories/g_repository.dart';

class GetAllUsecase extends UseCase<List<Entity>, void> {
  final IRepository repository;

  GetAllUsecase(this.repository);

  @override
  Future<Stream<List<Entity>>> buildUseCaseStream(void params) async {
    final StreamController<List<Entity>> controller =
        StreamController<List<Entity>>();
    try {
      controller.add(await list());
      controller.close();
    } catch (e) {
      print(e);
      controller.addError(e);
    }
    return controller.stream;
  }

  Future<List<Entity>> list() async {
    return repository.getAll();
  }
}
