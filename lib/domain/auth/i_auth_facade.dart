import 'package:classpay_new/domain/auth/auth_failure.dart';
import 'package:classpay_new/domain/auth/user.dart';
import 'package:classpay_new/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthFacade {
 Future<DomainUser?> getSignInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password});
  Future<Either<AuthFailure, Unit>> signWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password});
  Future<Either<AuthFailure,Unit>> signInWithGoogle();
  Future<void> signOut();
}
