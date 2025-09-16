// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injectable_test_remote_data_source_impl.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _InjectableTestRemoteDataSourceImpl
    implements InjectableTestRemoteDataSourceImpl {
  _InjectableTestRemoteDataSourceImpl(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'https://ddalemy.synology.me:8072/api';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<InjectableTestResponse<List<InjectableTest>>>
  getInjectableTests() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzU3NzI2Mzg2LCJpYXQiOjE3NTc1NzIwNTMsImp0aSI6IjRhZWQ0MGFmNTdhMzQyZTZiOGFkZjdkNWQyNTdhNzY1IiwidXNlcl9pZCI6MTU5fQ.yXDPEdiM-VGWLoNSygV-mpjCCbONPAYQ2cCbzBHdbbQ',
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<InjectableTestResponse<List<InjectableTest>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/tutor/list/',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late InjectableTestResponse<List<InjectableTest>> _value;
    try {
      _value = InjectableTestResponse<List<InjectableTest>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<InjectableTest>(
                    (i) => InjectableTest.fromJson(i as Map<String, dynamic>),
                  )
                  .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
