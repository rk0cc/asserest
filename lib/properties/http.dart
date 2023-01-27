part of '../property.dart';

/// [AsserestProperty] for HTTP protocol.
class AsserestHTTPProperty extends AsserestProperty {
  /// Method uses for making HTTP request.
  final String method;

  /// Header that uses for request.
  final UnmodifiableMapView<String, String> headers;

  /// Body content for making requedt.
  ///
  /// It must be `null` when using `GET` and `HEAD` methods and required
  /// either [Map] or [String]. If using [Map], it will be convert to
  /// JSON [String] automatically.
  final dynamic body;

  const AsserestHTTPProperty._(Uri url, this.method, this.headers, this.body,
      bool accessible, int timeout, int? tryCount)
      : super._(url, accessible, timeout, tryCount);

  @override
  int get hashCode => super.hashCode + quiver.hash3(method, headers, body);

  @override
  bool operator ==(Object other) =>
      other is AsserestHTTPProperty && hashCode == other.hashCode;
}