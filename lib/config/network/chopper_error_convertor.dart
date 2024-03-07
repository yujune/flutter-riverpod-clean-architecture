import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_clean_architecture/core/data/models/error_response/error_response.dart';

class AppErrorConverter implements ErrorConverter {
  @override
  FutureOr<Response> convertError<BodyType, InnerType>(Response response) {
    final errorResopnse = ErrorResponse.fromJson(
      json.decode(
        response.body,
      ),
    );

    return response.copyWith(
      bodyError: errorResopnse,
    );
  }
}
