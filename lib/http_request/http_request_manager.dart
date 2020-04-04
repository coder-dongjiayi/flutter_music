import 'package:flutter_music/http_request/config.dart';
import 'package:dio/dio.dart';

class HttpRequestManager{
//
//  factory  HttpRequestManager() => _getInstance();
//
//  static  HttpRequestManager get instance => _getInstance();
//
//  static HttpRequestManager _instance;
//
//  HttpRequestManager._internal();
//
//  static HttpRequestManager _getInstance(){
//    if(_instance == null){
//      _instance = new HttpRequestManager._internal();
//    }
//    return _instance;
//  }


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

    params  = params ?? Map();

    final options = Options(method: method);
    // 全局拦截器
    // 创建默认的全局拦截器
    Interceptor dInter = InterceptorsWrapper(
        onRequest: (options) {

          return options;
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
     params["uid"] = "300175285";
     params ["token"] = "7f7101fb8c35389a62aeba36a9137439182431def75947bd7fc789769c1233fd67541602d89e7826c01baea5eec646a941049cea1c6bb9b6";

    try {
      Response response = await dio.request(url, queryParameters: params, options: options);

      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }

  }


}