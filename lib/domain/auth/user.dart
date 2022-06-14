import 'package:classpay_new/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class DomainUser with _$DomainUser {
  const factory DomainUser({ required UniqueId userID}) = _DomainUser;
}

