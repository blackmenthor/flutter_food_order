import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user.g.dart';

@CopyWith()
class AyoMaemUser {
  AyoMaemUser({
    required this.uid,
    this.email,
    this.name,
  });

  final String uid;
  final String? email;
  final String? name;
}

extension UserExtension on User {
  AyoMaemUser get toLocalUser => AyoMaemUser(
      uid: uid,
      email: email,
  );
}