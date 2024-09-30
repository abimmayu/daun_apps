import 'package:daun_apps/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Dio dio = Dio();

Future<Response> getIt(
  String url,
) async {
  Logger().i(url);
  final result = await dio.get(
    url,
    options: Options(
      responseType: ResponseType.json,
      headers: {
        "api_key": AppConstant.apiKey,
        "api_id": AppConstant.apiId,
      },
    ),
  );
  // Logger().d(result.data);
  return result;
}

Future<Response> postIt(
  String url,
  Map<String, dynamic> body,
) async {
  Logger().i(url);
  final result = await dio.post(
    url,
    options: Options(
      responseType: ResponseType.json,
      headers: {
        "api_key": AppConstant.apiKey,
        "api_id": AppConstant.apiId,
      },
    ),
  );
  Logger().d(result.data);
  return result;
}
