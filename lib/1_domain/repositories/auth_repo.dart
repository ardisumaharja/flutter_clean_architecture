import 'package:either_dart/either.dart';
import 'package:rnd_clean_architecture/1_domain/domain.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signInFromDataSource(
      {required String email, required String password});
}
