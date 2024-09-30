import 'package:dartz/dartz.dart';
import 'package:daun_apps/core/failure/failure.dart';
import 'package:daun_apps/feature/login/domain/entities/user_data.dart';
import 'package:daun_apps/feature/login/domain/repository/login_repository.dart';
import 'package:logger/logger.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);
  Future<Either<Failure, User>> login(
      {required String username, required String password}) async {
    return await loginRepository.login(
      username: username,
      password: password,
    );
  }
}
