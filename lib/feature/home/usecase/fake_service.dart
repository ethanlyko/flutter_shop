import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/model/api_result.dart';
import '../repository/model/user.dart';
import '../../common/model/fake_api_const.dart';
import '../repository/fake_api.dart';
import '../repository/model/product.dart';
import '../repository/model/token.dart';

class FakeService {
  late final Dio _dio;
  late final FakeApi _client;

  FakeService._internal() {
    _dio = Dio();
    /*
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));
    */
    _client = FakeApi(_dio);
  }
  static final FakeService _instance = FakeService._internal();
  factory FakeService() => _instance;

  Future<ApiResult<List<Category>>> getCategories() async {
    return _getData(_client.getCategories);
  }

  Future<ApiResult<List<User>>> getUsers() async {
    return _getData(_client.getUsers);
  }

  Future<ApiResult<T>> _getData<T>(Future<T> Function() get) async {
    try {
      final result = await get();
      return Success(data: result);
    } on SocketException catch (e) {
      return Failure(e);
    } on DioException catch (e) {
      return Failure(
          ApiException(e.toString(), errorCode: e.response?.statusCode));
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<ApiResult<Product>> getProduct(int id) async {
    return _getDataParam1(_client.getProduct, id);
  }

  Future<ApiResult<User>> getUser(int id) async {
    return _getDataParam1(_client.getUser, id);
  }

  Future<ApiResult<T>> _getDataParam1<T>(
    Future<T> Function(int) get,
    int id,
  ) async {
    try {
      final result = await get(id);
      return Success(data: result);
    } on SocketException catch (e) {
      return Failure(e);
    } on DioException catch (e) {
      return Failure(
          ApiException(e.toString(), errorCode: e.response?.statusCode));
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<ApiResult<List<Product>>> getProducts({
    int offset = 0,
    int limit = FakeApiConst.apiQueryLimit,
  }) async {
    try {
      final result = await _client.getProducts(offset, limit: limit);
      return Success(data: result);
    } on SocketException catch (e) {
      return Failure(e);
    } on DioException catch (e) {
      return Failure(
          ApiException(e.toString(), errorCode: e.response?.statusCode));
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<ApiResult<List<Product>>> getProductsByFilter(
    Map<String, dynamic> queries,
  ) async {
    try {
      final result = await _client.getProductsByFilter(queries);
      return Success(data: result);
    } on SocketException catch (e) {
      return Failure(e);
    } on DioException catch (e) {
      return Failure(
          ApiException(e.toString(), errorCode: e.response?.statusCode));
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<ApiResult<Token>> login(
    String email,
    String password,
  ) async {
    try {
      final result = await _client.login(email, password);
      return Success(data: result);
    } on SocketException catch (e) {
      return Failure(e);
    } on DioException catch (e) {
      return Failure(
          ApiException(e.toString(), errorCode: e.response?.statusCode));
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  Future<ApiResult<Token>> refreshToken(
    String refreshToken,
  ) async {
    try {
      final result = await _client.refreshToken(refreshToken);
      return Success(data: result);
    } on SocketException catch (e) {
      return Failure(e);
    } on DioException catch (e) {
      return Failure(
          ApiException(e.toString(), errorCode: e.response?.statusCode));
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }
}

final fakeServiceProvider = Provider((ref) => FakeService());
