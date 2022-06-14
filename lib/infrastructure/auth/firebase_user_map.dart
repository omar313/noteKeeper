import 'package:classpay_new/domain/auth/user.dart';
import 'package:classpay_new/domain/core/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserMapper on User {
  DomainUser toDomain(){
    return DomainUser(userID: UniqueId.fromUniqueString(uid));
  }
}