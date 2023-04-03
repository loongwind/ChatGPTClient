import 'package:chatgpt_client/http/exception.dart';
import 'package:chatgpt_client/main.dart';
import 'package:chatgpt_client/model/intl.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool handleException(ApiException exception,
    {bool Function(ApiException)? onError}) {
  if (onError?.call(exception) == true) {
    return true;
  }

  // if (exception.code == 401) {
  //   ///todo to login
  //   return true;
  // }

  // EasyLoading.showError(exception.message ?? ApiException.unknownException);
  final context = navigatorKey.currentState?.overlay?.context;
  FluentLocalizations;
  if(context != null){
     Get.snackbar(S.warningTip.tr, "${exception.message ?? S.loginException.tr}，${S.loginExceptionTips.tr}", maxWidth: 400, colorText: Theme.of(context).colorScheme.error);
  }

  return false;
}
