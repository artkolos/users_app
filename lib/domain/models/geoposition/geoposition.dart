import 'package:freezed_annotation/freezed_annotation.dart';

part 'geoposition.freezed.dart';

part 'geoposition.g.dart';

@freezed
class GeoPosition with _$GeoPosition {
  const factory GeoPosition({
    required String lat,
    required String lng,
  }) = _GeoPosition;

  factory GeoPosition.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$GeoPositionFromJson(json);
}
