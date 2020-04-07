import 'package:flutter_music/http_request/config.dart';
import 'package:dio/dio.dart';

class HttpRequestManager{

  factory  HttpRequestManager() => _getInstance();

  static  HttpRequestManager get instance => _getInstance();

  static HttpRequestManager _instance;

  HttpRequestManager._internal();

  static HttpRequestManager _getInstance(){
    if(_instance == null){
      _instance = new HttpRequestManager._internal();
    }
    return _instance;
  }

  Map<String, dynamic> _publicParams;

  void registerPublicParams(Map<String, dynamic> params){
    _publicParams = params;
  }

  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseURL,
    connectTimeout: HttpConfig.timeout
  );



  static final Dio dio = Dio(baseOptions);


  static Future<T> request<T>(String url,
      {
        String method = "post",
        Map<String, dynamic> params,
         Interceptor inter
      } ) async {

    params  = params ?? Map<String, dynamic>();

    final options = Options(method: method);
    // 全局拦截器
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
        onRequest: (RequestOptions warpperOptions) {

         // warpperOptions.queryParameters = HttpRequestManager.instance._publicParams;

          return warpperOptions;
        },
        onResponse: (response) {

          return response;
        },
        onError: (err) {

          return err;
        }
    );


    List<Interceptor> inters = [dInter];

    // 请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }

    // 统一添加到拦截器中
    dio.interceptors.addAll(inters);

    //添加公共参数
    if(HttpRequestManager.instance._publicParams != null){
      params.addAll(HttpRequestManager.instance._publicParams);

    }

    try {
      Response response = await dio.request(url, queryParameters: params, options: options);

      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }

  }


}