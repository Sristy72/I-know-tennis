class ApiConstants {
  /// [Base Configuration]
  // static const String baseDomain = 'http://10.10.5.53:8000';
  static const String baseDomain = 'http://10.10.5.32:8000';
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

  static QuizEndpoints get quiz => QuizEndpoints();
  static LeagueEndpoints get league => LeagueEndpoints();

  static ContactEndpoints get contact => ContactEndpoints();

  static PaymentEndpoints get payment => PaymentEndpoints();
  static RecruiterAccountApi get recruiter => RecruiterAccountApi();

  static ProfileEndpoints get profile => ProfileEndpoints();
  static HomeEndpoints get home => HomeEndpoints();
}

class RecruiterAccountApi {
  final String getCompany = '${ApiConstants.baseUrl}/all/companies';
}

/// [Authentication Endpoints]
class AuthEndpoints {
  static const String _base = '${ApiConstants.baseUrl}/auth';

  final String login = '$_base/login';
  final String register = '$_base/signup';
  final String forget = '$_base/forgot-password';
  final String verify = '$_base/verify-otp';
  final String refreshToken = '${ApiConstants.baseUrl}/auth/reset-refresh-token';

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

class QuizEndpoints {
  static const String _base = '${ApiConstants.baseUrl}/quiz';
  final String getQuiz = _base;
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
  static const String _base = '${ApiConstants.baseUrl}/subscription-plan';

  final String createPayment = '$_base/checkout';

  final String confirmPayment = '$_base/confirm-payment';
}

class ProfileEndpoints {
  static const String _base = '${ApiConstants.baseUrl}/user';
  String fetchProfile(String userId) => '$_base/$userId';
  final String updateProfile = '$_base/profile';
  final String fetchAllSubs = '${ApiConstants.baseUrl}/subscription-plan';
}

class HomeEndpoints {
  static const String _base = '${ApiConstants.baseUrl}/quiz';
  final String getQuiz = _base;
  final String getCategories = '${ApiConstants.baseUrl}/quiz-categories';
}
