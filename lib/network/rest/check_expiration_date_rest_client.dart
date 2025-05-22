import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../utils/global_constants.dart';

part 'check_expiration_date_rest_client.g.dart';

@RestApi()
abstract class CheckExpirationDateRestClient {

  factory CheckExpirationDateRestClient(Dio dio, {String? baseUrl}) = _CheckExpirationDateRestClient;

  @FormUrlEncoded()
  @Headers(GlobalConstants.headers)
  @POST('get-expiration-date.php')
  Future<String> checkExpirationDateOfClientId(
      @Field("client_id") int clientId,
      @Field("token") String token,
  );

}
