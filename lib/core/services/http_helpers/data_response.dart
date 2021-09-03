import 'custom_exception.dart';

class DataResponse<T> {
  final Exception error;
  final T data;
  DataResponse({this.data, this.error})
      : assert((data != null) || (error != null),
            'Both data and error cannot be null]');

  bool get hasError => error != null;
}

extension Converter<E> on DataResponse<Map<String, dynamic>> {
  DataResponse<E> transform<E>(
    E Function(Map<String, dynamic> data) transformer, {
    bool ignoreError = false,
  }) {
    E transformedData;
    if (data != null) {
      transformedData = (ignoreError || !hasError) ? transformer(data) : null;
    }
    return DataResponse<E>(
      data: transformedData,
      error: error,
    );
  }

  DataResponse<bool> transformToStatusOnly(
      {bool Function(Map<String, dynamic> data) statusChecker}) {
    bool status = false;
    if (data != null) {
      if (statusChecker != null) {
        status = statusChecker(data);
      } else {
        status = data['statusCode'] == 200;
      }
    }

    return DataResponse(
      data: status,
      error: status ? error : error ?? CustomException('An error occurred'),
    );
  }
}
