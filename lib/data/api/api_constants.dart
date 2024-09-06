class ApiConstants {
  static const _api_token =
      "crcnn89r01qkg1le7680crcnn89r01qkg1le768g"; // this should be in git as a variable.

  static const _baseUrl = 'https://finnhub.io';

  static const timeout = 60;

  static const getForexSymbols =
      "$_baseUrl/api/v1/forex/symbol?exchange=oanda&token=$_api_token";

  static const getCryptoSymbols =
      "$_baseUrl/api/v1/crypto/symbol?exchange=binance&token=$_api_token";

  static const getQuotes = "$_baseUrl/api/v1/quote?token=$_api_token";

  static const webSocketApi = "wss://ws.finnhub.io?token=$_api_token";
}
