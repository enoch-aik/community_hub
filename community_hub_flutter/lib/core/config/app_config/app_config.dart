

class AppConfig {
  final String baseUrl;

  AppConfig(
      this.baseUrl,);

  AppConfig.fromJson(Map<Object, dynamic> env)
      : baseUrl = env["baseUrl"];
}

enum CommunityHubEnv {
  dev,prod
}
