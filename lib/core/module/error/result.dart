import 'package:ex_project/core/module/exception/app_exception.dart';

// 에러 처리
// sealed class를 이용한 타입 안정성 확보
// 성공 or 실패
sealed class Result<T> {
  const factory Result.success(T data) = Success;

  const factory Result.error(AppException error) = Error;
}

class Success<T> implements Result<T> {
  final T data;

  const Success(this.data);
}

class Error<T> implements Result<T> {
  final AppException error;

  const Error(this.error);
}
