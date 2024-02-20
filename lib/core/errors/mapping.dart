import 'package:my_clean/core/errors/failures.dart';
import 'package:my_clean/core/strings/error_messages.dart';

String getErrorMessage(Failure failure) {
  switch (failure.runtimeType) {
    case NoConnectionFailure:
      return ErrorMessages.noInternetError;

    case ServerFailure:
      return ErrorMessages.serverError;

    case CacheFailure:
      return ErrorMessages.emptyCacheError;
    default:
      return ErrorMessages.unexpectedError;
  }
}
