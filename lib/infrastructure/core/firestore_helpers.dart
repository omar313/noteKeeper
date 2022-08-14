import 'package:classpay_new/domain/auth/i_auth_facade.dart';
import 'package:classpay_new/domain/core/errors.dart';
import 'package:classpay_new/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignInUser();
    if (userOption == null) {
      throw NotAuthenticateError();
    } else {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(userOption.userID.getOrCrash());
    }
  }
}

extension DocumentReferenceX on DocumentReference{
  CollectionReference get noteCollection => collection('notes');
}
