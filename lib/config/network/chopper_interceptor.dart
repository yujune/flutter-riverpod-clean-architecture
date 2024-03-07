import 'dart:async';
import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:flutter_clean_architecture/config/navigation/navigation_service.dart';
import 'package:flutter_clean_architecture/core/data/models/error_response/error_response.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/show_error_dialog.dart';

class AppInterceptor implements ResponseInterceptor {
  @override
  FutureOr<Response> onResponse(Response response) {
    if (response.isSuccessful) {
      return response;
    }

    if (response.error != null) {
      if (response.statusCode == HttpStatus.unauthorized) {
        // TODO refresh token.
      } else {
        final error = response.error;
        if (error is ErrorResponse) {
          showErrorDialog(
            context: NavigationService.navigatorKey.currentContext!,
            message: error.message,
          );
          throw error;
        }
      }
    }

    return response;
  }
}
