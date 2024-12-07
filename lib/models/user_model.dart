import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'user_model.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo,
  }) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}

@freezed
class Geo with _$Geo {
  const factory Geo({
    String? lat,
    String? lng,
  }) = _Geo;
  factory Geo.fromJson(Map<String, Object?> json) => _$GeoFromJson(json);
}

@freezed
class Company with _$Company {
  const factory Company({
    String? name,
    String? catchPhrase,
    String? bs,
  }) = _Company;
  factory Company.fromJson(Map<String, Object?> json) =>
      _$CompanyFromJson(json);
}
