/// Verifies provided string to be url.
String? urlVerifier(String? data) =>
    data != null ? Uri.parse(data).toString() : null;

T checkRequired<T>(T? data, String name) {
  if (data == null) {
    throw '[$name] must not be null';
  }

  return data;
}
