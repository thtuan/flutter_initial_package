class Configuration {
  // final String appName;
  // final String appVersion;
  // final int buildNumber;

  final bool enableCipher;
  final String cipherKey;
  final String saltKey;
  final String xApiKey;
  final bool enableLogs;

  Configuration(
      {this.enableCipher = false,
      this.cipherKey = '',
      this.saltKey = '',
      this.xApiKey = '',
      this.enableLogs = true});
}
