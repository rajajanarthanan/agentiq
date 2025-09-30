import 'package:agentiq/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<AgentiqUser> agentiqUserFromFirebaseUser(User firebaseUser) async {
  //TODO: Implement CloudFunction call with firebaseUser.uid

  return AgentiqUser(
    id: firebaseUser.uid,
    role: UserRole.user,
    name: firebaseUser.displayName ?? "",
    email: firebaseUser.email ?? "",
    phoneNumber: firebaseUser.phoneNumber,
    profilePictureUrl: firebaseUser.photoURL,
  );
}
