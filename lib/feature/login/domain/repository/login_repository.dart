import 'package:dartz/dartz.dart';
import 'package:daun_apps/core/failure/failure.dart';
import 'package:daun_apps/feature/login/domain/entities/user_data.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> login({
    required String username,
    required String password,
  });
}
