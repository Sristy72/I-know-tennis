import 'package:flutter_iknow_tennis/features/auth/data/model/login_request_model.dart';
import 'package:flutter_iknow_tennis/features/auth/data/model/login_response_model.dart';

import '../../../core/network/network_result.dart';

abstract class AuthRepository {
  NetworkResult<LoginResponseModel> login(LoginRequestModel request);
}
