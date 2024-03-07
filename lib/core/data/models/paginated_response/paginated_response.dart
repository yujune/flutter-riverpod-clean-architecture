import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_response.freezed.dart';

part 'paginated_response.g.dart';

@Freezed(genericArgumentFactories: true)
class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    int? total,
    int? skip,
    int? limit,
    List<T>? products,
  }) = _PaginatedResponse<T>;

  factory PaginatedResponse.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$PaginatedResponseFromJson(json, fromJsonT);
}
