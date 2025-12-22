class ApiConstants {
  /// [Base Configuration]
  static const String baseDomain = 'http://10.10.5.53:5001';
  static const String baseUrl = '$baseDomain/api/v1';


  /// [Headers]
  static Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Map<String, String> authHeaders(String token) => {
    ...defaultHeaders,
    'Authorization': 'Bearer $token',
  };

  static Map<String, String> get multipartHeaders => {
    'Accept': 'application/json',
    // Content-Type will be set automatically for multipart
  };

  /// [Endpoint Groups]
  static AuthEndpoints get auth => AuthEndpoints();

  static UserEndpoints get user => UserEndpoints();
  static NotificationEndpoints get notification => NotificationEndpoints();

  static ProductEndpoints get product => ProductEndpoints();
  static LeagueEndpoints get league => LeagueEndpoints();

  static ContactEndpoints get contact => ContactEndpoints();

  static PaymentEndpoints get payment => PaymentEndpoints();
  static RecruiterAccountApi get recruiter => RecruiterAccountApi();

  static ProfileEndpoints get profile => ProfileEndpoints();
}

class RecruiterAccountApi {
  final String getCompany = '${ApiConstants.baseUrl}/all/companies';
}

/// [Authentication Endpoints]
class AuthEndpoints {
  static const String _base = '${ApiConstants.baseUrl}/auth';

  final String login = '$_base/login';
  final String register = '$_base/register';
  final String forget = '$_base/forget';
  final String verify = '$_base/verify';
  final String refreshToken = '${ApiConstants.baseUrl}/auth/refresh-token';

  // Password Reset Flow
  final String resetPass = '$_base/forget'; // Send OTP for forgot password
  final String otpVerifyResetPassword =
      '$_base/reset-password'; // OTP verification for password reset
  final String otpVerifyRegister =
      '$_base/verify'; // OTP verification (register flow)
  final String changePassword =
      '$_base/change-password'; // Change password with old and new

  // Security Questions
  final String defaultSecurityQuestions =
      '${ApiConstants.baseUrl}/default-security-questions';
  final String securityAnswers = '${ApiConstants.baseUrl}/security-answers';
  final String verifySecurityAnswers =
      '${ApiConstants.baseUrl}/security-answers/verify';
  final String resetPasswordWithToken =
      '${ApiConstants.baseUrl}/security-answers/reset-password';

  get otpVerifyReset => null;
  final String updatePassword = '$_base/change-password';
}

class UserEndpoints {
  static const String _base = '${ApiConstants.baseUrl}/user';
  final String updateProfile = '$_base/update-profile';
  final String getUserProfile = '$_base/profile';

  // final String create = '$_base/create';
}

class NotificationEndpoints {
  static const String _base = '${ApiConstants.baseUrl}/notification';

  final String getnotifications = '$_base/getnotifications';
}

class ProductEndpoints {
  static const String _base = '${ApiConstants.baseUrl}/products';
  final String getProducts = _base;

  final String create = '$_base/create';
}

class LeagueEndpoints {
  static const String _base = '${ApiConstants.baseUrl}/league';

  final String getAllLeagues = '$_base/all-league';
}

class ContactEndpoints {
  static const String _base = '${ApiConstants.baseUrl}/contact';
  final String createContact = '$_base/create';
}

// New payment endpoints
class PaymentEndpoints {
  static const String _base = '${ApiConstants.baseUrl}/payment';

  final String createPayment = '$_base/create-payment';

  final String confirmPayment = '$_base/confirm-payment';
}

class ProfileEndpoints {
  static const String _base = '${ApiConstants.baseUrl}/user';
  final String fetchProfile = '$_base/profile';
  final String updateProfile = '$_base/profile';

  String fetchFavorite(String userId) => '${ApiConstants.baseUrl}/favorites/$userId';
  final String fetchOngoing = '${ApiConstants.baseUrl}/orders/my?filter=ongoing';
  final String fetchDelivered = '${ApiConstants.baseUrl}/orders/my?filter=completed';
  final String fetchOrder = '${ApiConstants.baseUrl}/orders';
  // String fetchCategory(String userId) =>;
}
