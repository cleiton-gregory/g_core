import 'package:g_core/src/domain/entities/g_entity.dart';

abstract class IRepository {
   Future<List<Entity>> getAll();
}
