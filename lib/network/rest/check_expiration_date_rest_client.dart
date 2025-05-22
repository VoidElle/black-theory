import 'package:dio/dio.dart' show Dio;
import 'package:retrofit/retrofit.dart';

import '../../models/response_expiration_check_model.dart';
import '../../utils/global_constants.dart';

part 'check_expiration_date_rest_client.g.dart';

@RestApi()
abstract class CheckExpirationDateRestClient {

  factory CheckExpirationDateRestClient(Dio dio, {String? baseUrl}) = _CheckExpirationDateRestClient;

  @FormUrlEncoded()
  @Headers(GlobalConstants.headers)
  @GET('get-expiration-date.php')
  Future<ResponseExpirationCheckModel> checkExpirationDateOfClientId(
      @Field("client_id") int clientId,
      @Field("token") String token,
  );

}
