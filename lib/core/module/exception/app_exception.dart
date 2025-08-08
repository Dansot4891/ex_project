// 기본적으로 앱에서 발생하는 에러의 베이스가 되는 Exception
abstract class AppException implements Exception {
  final int code;
  final String message;

  const AppException(this.code, this.message);
}

// 직접 서버로부터 메시지를 할당
class CustomAppException extends AppException {
  const CustomAppException(super.code, super.message);
}

// 알 수 없는 에러일 때 사용
class UnexpectedException extends AppException {
  const UnexpectedException() : super(501, '문제가 발생했습니다. 잠시 후 다시 시도해주세요.');
}

// 지원되지 않는 플랫폼
class UnsupportedPlatformException extends AppException {
  const UnsupportedPlatformException() : super(512, '지원되지 않는 플랫폼입니다.');
}

// 결제 에러
class PaymentException extends AppException {
  const PaymentException() : super(513, '결제 중 에러가 발생하였습니다.');
}
