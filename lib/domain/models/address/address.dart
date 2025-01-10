import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_app/domain/models/geoposition/geoposition.dart';

part 'address.freezed.dart';

part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required GeoPosition geo,
  }) = _Address;

  factory Address.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AddressFromJson(json);
}
