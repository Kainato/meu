import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/core/api/api_request.dart';
import 'package:myapp/core/api/status_code.dart';
import 'package:myapp/enum/cache_prefs_key.dart';

/// Classe que consome as requisições HTTP. Ela é responsável por fazer as requisições
/// HTTP para o servidor, tratar os erros e dar as respostas esperadas.
class HttpRequest {
  /// Função que consome as requisições HTTP.
  /// ### Parâmetros
  /// - `route` é a rota da requisição. Não precisa da URL base, pois ela é definida
  /// automaticamente. Exemplo: `profissional/listagem/${Id}`.
  /// - `apiRequest` é o tipo de requisição que será feita.
  /// - `body` é o corpo da requisição. Ele é um Map<String, dynamic> e é opcional.
  /// - `sendTimeout` é o tempo de envio da requisição. O padrão é 30 segundos.
  /// - `receiveTimeout` é o tempo de recebimento da requisição. O padrão é 30 segundos.
  static Future<Response> consume(
    String route, {
    required ApiRequest apiRequest,
    Map<String, dynamic> body = const {},
    int sendTimeout = 30,
    int receiveTimeout = 30,
    bool showDataSendLog = false,
    bool showInterceptorLog = false,
    bool sendToken = true,
    // bool showStatusLog = false,
  }) async {
    // Resgatando as preferências do usuário
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Resgatando o token do usuário
    String getToken = prefs.getString(CachePrefsKey.token.key) ?? '';

    // Criando a variável que segura a URL do servidor baseado no cache do usuário
    String serverUrl = prefs.getString(CachePrefsKey.server.key) ?? '';

    // Verificando qual URL de servidor foi escolhida e definindo a URL
    if (serverUrl == '') {
      log('Server URL está vazia!', name: 'HttpRequest | Error');
      return Response(
        requestOptions: RequestOptions(path: '0'),
        statusCode: 0,
        data: 'Erro de rota!',
        statusMessage:
            'Alguma coisa aconteceu durante esta operação! Tente reiniciar o aplicativo!',
      );
    }

    if (showDataSendLog) {
      log(
        '$serverUrl/$route',
        name: 'HttpRequest | Route',
      );
      log(
        'ApiRequest: $apiRequest',
        name: 'HttpRequest | ApiRequest',
      );
      log(
        'Body: ${json.encode(body)}',
        name: 'HttpRequest | Data/Body',
      );
      log(
        'SendTimeout: $sendTimeout segundos',
        name: 'HttpRequest | SendTimeout',
      );
      log(
        'ReceiveTimeout: $receiveTimeout segundos',
        name: 'HttpRequest | ReceiveTimeout',
      );
    }

    // Instanciando o Dio
    final Dio dio = Dio();

    // Adicionando um interceptor de log. Ele serve para logar as requisições HTTP
    // e suas respectivas respostas e erros
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          if (showInterceptorLog) {
            log(
              'Request[${options.method}] => PATH: ${options.path}',
              name: 'HttpRequest | onRequest',
            );
          }
          return handler.next(options); // continue
        },
        onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
          if (showInterceptorLog) {
            log(
              'Response[${response.statusCode}] => DATA: ${response.data.toString()}',
              name: 'HttpRequest | onResponse',
            );
          }
          return handler.next(response); // continue
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          if (showInterceptorLog) {
            log(
              'Error[${e.response?.statusCode}] => MESSAGE: ${e.message}',
              name: 'HttpRequest | onError',
            );
          }
          return handler.next(e); // continue
        },
      ),
    );

    // Função auxiliar para realizar a requisição e tratar erros
    Future<Response> makeRequest(Future<Response> Function() request) async {
      try {
        final response = await request();
        return response;
      } on DioException catch (e) {
        if (e.response != null) {
          switch (e.response!.statusCode) {
            case 400:
              // Erro 400 (Bad Request)
              return Response(
                requestOptions:
                    RequestOptions(path: StatusCode.invalido.code.toString()),
                statusCode: StatusCode.invalido.code,
                data: StatusCode.invalido.type,
                statusMessage: StatusCode.invalido.title,
              );
            case 401:
              // Erro 401 (Unauthorized)
              return Response(
                requestOptions: RequestOptions(
                    path: StatusCode.naoAutorizado.code.toString()),
                statusCode: StatusCode.naoAutorizado.code,
                data: StatusCode.naoAutorizado.type,
                statusMessage: StatusCode.naoAutorizado.title,
              );
            case 404:
              // Erro 404 (Not Found)
              return Response(
                requestOptions: RequestOptions(
                    path: StatusCode.inexistente.code.toString()),
                statusCode: StatusCode.inexistente.code,
                data: StatusCode.inexistente.type,
                statusMessage: StatusCode.inexistente.title,
              );
            case 500:
              // Erro 500 (Internal Server Error)
              return Response(
                requestOptions:
                    RequestOptions(path: StatusCode.erro.code.toString()),
                statusCode: StatusCode.erro.code,
                data: StatusCode.erro.type,
                statusMessage: StatusCode.erro.title,
              );
            default:
              // Erro desconhecido
              return Response(
                requestOptions: RequestOptions(path: '0'),
                statusCode: 0,
                data: 'Erro desconhecido!',
                statusMessage: 'Não foi possível identificar o erro!',
              );
          }
        } else {
          // Tratar erros que não possuem resposta (ex: problemas de rede)
          return Response(
            requestOptions: RequestOptions(path: '0'),
            statusCode: 0,
            data: 'Erro não identificado!',
            statusMessage: 'Não foi possível identificar o erro!',
          );
        }
      }
    }

    // Variável que segura a resposta da requisição
    late Response? response;

    // Variável que segura a duração da requisição de envio
    Duration sendDuration = Duration(seconds: sendTimeout);

    // Variável que segura a duração da requisição de recebimento
    Duration receiveDuration = Duration(seconds: receiveTimeout);

    // Verificando qual tipo de requisição foi escolhida
    switch (apiRequest) {
      case ApiRequest.delete:
        response = await makeRequest(
          () => dio.delete(
            '$serverUrl/$route',
            data: body,
            options: Options(
              sendTimeout: sendDuration,
              receiveTimeout: receiveDuration,
              headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                if (sendToken) "Authorization": "Bearer $getToken",
              },
            ),
          ),
        );
        break;
      case ApiRequest.get:
        response = await makeRequest(
          () => dio.get(
            '$serverUrl/$route',
            queryParameters: body,
            options: Options(
              sendTimeout: sendDuration,
              receiveTimeout: receiveDuration,
              headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                if (sendToken) "Authorization": "Bearer $getToken",
              },
            ),
          ),
        );
        break;
      case ApiRequest.post:
        response = await makeRequest(
          () => dio.post(
            '$serverUrl/$route',
            data: body,
            options: Options(
              sendTimeout: sendDuration,
              receiveTimeout: receiveDuration,
              headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                if (sendToken) "Authorization": "Bearer $getToken",
              },
            ),
          ),
        );
        break;
      case ApiRequest.put:
        response = await makeRequest(
          () => dio.put(
            '$serverUrl/$route',
            data: body,
            options: Options(
              sendTimeout: sendDuration,
              receiveTimeout: receiveDuration,
              headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                if (sendToken) "Authorization": "Bearer $getToken",
              },
            ),
          ),
        );
        break;
      default:
        log(
          'ApiRequest não encontrada ou não configurada!',
          name: 'HttpRequest | consume',
        );
        break;
    }

    // Retornando a resposta da requisição
    return response!;
  }
}
