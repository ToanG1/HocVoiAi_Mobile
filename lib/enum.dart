enum TokenType {
  REFRESH_TOKEN,
  ACCESS_TOKEN,
  RESET_TOKEN,
  URL_TOKEN,
  ACTIVATION_TOKEN,
}

extension TokenTypeExtension on TokenType {
  String get value {
    switch (this) {
      case TokenType.REFRESH_TOKEN:
        return 'refresh_token';
      case TokenType.ACCESS_TOKEN:
        return 'access_token';
      case TokenType.RESET_TOKEN:
        return 'reset_token';
      case TokenType.URL_TOKEN:
        return 'url_token';
      case TokenType.ACTIVATION_TOKEN:
        return 'activation_token';
      default:
        throw Exception('Invalid TokenType');
    }
  }
}
