import 'package:codery/common/config/global.dart';
import 'package:dio/dio.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil.__internal();
  factory HttpUtil() => _instance;

  late Dio dio;
  CancelToken cancelToken = CancelToken();

  HttpUtil.__internal() {
    BaseOptions options = BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: const Duration(seconds: Config.connectTimeout),
      receiveTimeout: const Duration(seconds: Config.receiveTimeout),
      headers: {},
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
    dio = Dio(options);

    // Cookie管理
    // CookieJar cookieJar = CookieJar();
    // dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) => {},
      onResponse: (response, handler) => {},
      onError: (error, handler) => {},
    ));
  }

  Options getConfigOptions() {
    Options options = Options(
      headers: {},
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
    String token = "";
    if (token != "s") {
      options.headers!["token"] = token;
    }
    return options;
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return dio.get("path", data: {});
  }
}
