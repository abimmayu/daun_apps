import 'package:daun_apps/core/service/dio.dart';
import 'package:daun_apps/core/utils/constants.dart';
import 'package:daun_apps/feature/login/domain/entities/user_data.dart';

abstract class LoginDataPost {
  Future<User> login({
    required String username,
    required String password,
  });
}

class LoginDataPostImpl implements LoginDataPost {
  @override
  Future<User> login({
    required String username,
    required String password,
  }) async {
    const url = '${AppConstant.baseUrl}sso';
    final result = await postIt(
      url,
      {
        "j_username": username,
        "j_password": password,
      },
    );
    return User.fromJson(result.data);
  }
}
