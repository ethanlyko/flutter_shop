import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../usecase/auth_service.dart';

part 'auth_control.g.dart';

@riverpod
class AuthControl extends _$AuthControl {
  @override
  FutureOr<UserCredential?> build() => null;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final value = authService.register(email, password);
      return value;
    });
  }

  Future<void> signInAnonymousely() async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(authService.signInAnonymously);
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final authService = ref.read(authServiceProvider);
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final value = await authService.signInWithPassword(email, password);
      return value;
    });

    /*
    UserCredential(
      additionalUserInfo: AdditionalUserInfo(
        isNewUser: false, 
        profile: {}, 
        providerId: password, 
        username: null, 
        authorizationCode: null
      ), 
      credential: null, 
      user: User(
        displayName: null, 
        email: flutter@example.com, 
        isEmailVerified: false, 
        isAnonymous: false, 
        metadata: UserMetadata(
          creationTime: 2024-05-23 10:22:36.945Z, 
          lastSignInTime: 2024-10-02 10:18:07.317Z
        ), 
        phoneNumber: null, 
        photoURL: null, 
        providerData, [
          UserInfo(
            displayName: null, 
            email: flutter@example.com, 
            phoneNumber: null, 
            photoURL: null, 
            providerId: password, 
            uid: flutter@example.com
          )
        ], 
        refreshToken: AMf-vBzz1QR4XEv94f9Ce1t3fm8P9JpolWSqI_t5RyEYr3wYz44YEnM8EIaKMHq64fh7HaaNCWWSZpnCgCJ8aW2zq6PSWd2R4TV-ZtUcZhCaDXUEpNeClA-tCN253FAtaTCcP7JFRtUWGQodHY1IPMyyi3Um1FYzJqFRDxGNs0DCjb_4p0gfvf4DAGcrLY_ebqHABEYuXT2m, 
        tenantId: null, 
        uid: HVFx6eo9ynSaMjhxgdklBg4yLpd2
        )
      )
    */
  }

  Future<void> signOut() async {
    final authService = ref.read(authServiceProvider);
    state = await AsyncValue.guard(() async {
      await authService.signOut();
      return null;
    });
  }
}
