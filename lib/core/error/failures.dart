abstract class Failure {
  const Failure(this.errorMessage);

  final String errorMessage;

  @override
  String toString() {
    return errorMessage;
  }
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.errorMessage);
}
