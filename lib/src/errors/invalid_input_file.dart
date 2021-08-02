enum InvalidInputFileReason {
  notFound,
  unRecognized
}

class InvalidInputFile implements Exception {
  const InvalidInputFile(this.reason);
  final InvalidInputFileReason reason;

  @override
  String toString() {
    if (reason == InvalidInputFileReason.notFound) {
      return 'Exception [InvalidInputFile] occurred, Reason [notFound]';
    } else {
      return 'Exception [InvalidInputFile] occurred, Reason [unRecognized]';
    }
  }
}