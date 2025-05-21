import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'check_expiration_date_rest_client.g.dart';

@RestApi()
abstract class CheckExpirationDateRestClient {

  factory CheckExpirationDateRestClient(Dio dio, {String? baseUrl}) = _CheckExpirationDateRestClient;

  @GET('get-expiration-date.php')
  Future<dynamic> checkExpirationDateOfClientId();

}
