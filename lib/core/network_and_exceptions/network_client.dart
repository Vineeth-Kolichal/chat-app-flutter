import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// @lazySingleton
// @injectable
class Client {
  final Dio dio;
  final Dio dioNoToken;
  Client(this.dio, this.dioNoToken);
  postWithoutToken({required String endPoint, dynamic body}) async {}
}
