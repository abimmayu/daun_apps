import 'package:dartz/dartz.dart';
import 'package:daun_apps/core/failure/failure.dart';
import 'package:daun_apps/feature/login/data/data_post/login_data_post.dart';
import 'package:daun_apps/feature/login/domain/entities/user_data.dart';
import 'package:daun_apps/feature/login/domain/repository/login_repository.dart';
import 'package:dio/dio.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginDataPost loginDataPost;
  LoginRepositoryImpl({required this.loginDataPost});

  @override
  Future<Either<Failure, User>> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await loginDataPost.login(
        username: username,
        password: password,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(
        LoginFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
