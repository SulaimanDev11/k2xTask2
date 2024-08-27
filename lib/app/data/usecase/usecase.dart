
import '../params/params.dart';

abstract class Usecase<Type, P extends Params> {
  Future<Type> call(P params);
}