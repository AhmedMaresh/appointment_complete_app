class ApiConstants {
  static const String apiBaseUrl = 'https://vcare.integration25.com/api/';
  static const String login = 'auth/login';
  static const String signup = 'auth/register';
}

class ApiErrors {
  static const String badRequestError = "Bad request";
  static const String noContent = "no content";
  static const String forbiddenError = "Forbidden request";
  static const String unauthorizedError = "User is unauthorized";
  static const String notFoundError = "Url is not found";
  static const String conflictError = "Conflict error";
  static const String internalServerError = "Internal server error";
  static const String unknownError = "Unknown error";
  static const String timeoutError = "Timeout error";
  static const String defaultError = "Default error";
  static const String cacheError = "Cache error";
  static const String noInternetError = "No internet";
  static const String loadingMessage = "Loading...";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "OK";
}
