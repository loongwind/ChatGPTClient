import 'dart:io';

class ProxiedHttpOverrides extends HttpOverrides {
  String _port;
  String _host;
  ProxiedHttpOverrides(this._host, this._port);

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
    // set proxy
      ..findProxy = (uri) {
        return "PROXY $_host:$_port;";
      };
  }
}