import 'package:cookie_jar/cookie_jar.dart';
class APIS {
  static final cookieJar = CookieJar();
  static List<SerializableCookie>? serializableCookies;
  static const login = "/api/auth/login";
}
