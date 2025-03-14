import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../common/model/fake_api_const.dart';
import 'model/product.dart';
import 'model/token.dart';
import 'model/user.dart';

part 'fake_api.g.dart';

@RestApi(baseUrl: 'https://api.escuelajs.co')
abstract class FakeApi {
  factory FakeApi(Dio dio) = _FakeApi;

  @GET('/api/v1/categories')
  Future<List<Category>> getCategories();

  @GET('/api/v1/products?')
  Future<List<Product>> getProducts(
    @Query("offset") int offset, {
    @Query("limit") int limit = FakeApiConst.apiQueryLimit,
  });

  @GET('/api/v1/products?')
  Future<List<Product>> getProductsByFilter(
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/api/v1/products/{id}')
  Future<Product> getProduct(
    @Path("id") int id,
  );

  @GET('/api/v1/users')
  Future<List<User>> getUsers();

  @GET('/api/v1/users/{id}')
  Future<User> getUser(
    @Path("id") int id,
  );

  /* auth */
  @FormUrlEncoded()
  @POST('/api/v1/auth/login')
  Future<Token> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @FormUrlEncoded()
  @POST('/api/v1/auth/refresh-token')
  Future<Token> refreshToken(
    @Field("refreshToken") String refreshToken,
  );

  // @GET("/api/v1/auth/profile") Bearer Token
}
