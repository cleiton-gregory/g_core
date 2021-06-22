import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:g_core/src/domain/entities/g_entity.dart';

class GetAllUsecase extends UseCase<List<Entity>, void> {
  @override
  Future<Stream<List<Entity>>> buildUseCaseStream(void params) async {
    final StreamController<List<Entity>> controller =
        StreamController<List<Entity>>();
    try {
      controller.add(list());
      controller.close();
    } catch (e) {
      print(e);
      controller.addError(e);
    }
    return controller.stream;
  }

  List<Entity> list() {
    return [];
  }
}
