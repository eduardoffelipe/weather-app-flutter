sealed class ForecastException implements Exception {
  final String? message;
  final StackTrace? stackTrace;

  const ForecastException(this.message, [this.stackTrace]);

  @override
  String toString() {
    return "$runtimeType: $message${stackTrace == null ? '' : '\n$stackTrace'}";
  }
}

class ForecastRepositoryException extends ForecastException {
  const ForecastRepositoryException(super.message, [super.stackTrace]);
}
