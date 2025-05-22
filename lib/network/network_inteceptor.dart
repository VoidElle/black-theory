import 'package:black_theory/widgets/dialogs/loading_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class NetworkInterceptor extends InterceptorsWrapper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    final BuildContext context = navigatorKey.currentState!.context;
    LoadingDialog.show(context);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

    final BuildContext context = navigatorKey.currentState!.context;
    LoadingDialog.dismiss(context);

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {

    final BuildContext context = navigatorKey.currentState!.context;
    LoadingDialog.dismiss(context);

    super.onError(err, handler);
  }

}