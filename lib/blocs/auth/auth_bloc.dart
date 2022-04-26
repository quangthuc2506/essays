import 'package:bloc/bloc.dart';
import 'package:essays/repository/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(LoadingState()) {
    on<SignInEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await authRepository.singIn(
            email: event.email, password: event.password);
        Map<String, dynamic> userMap =
            await authRepository.getUser(event.email);
        emit(AuthenticatedState(userMap: userMap));
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticatedState());
      }
    });
    on<SignUpEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await authRepository.signUp(
            email: event.email,
            password: event.password,
            fullName: event.fullName,
            phoneNumber: event.phoneNumber);
        emit(AuthenticatedState());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticatedState());
      }
    });
    // When User Presses the Google Login Button, we will send the GoogleSignInRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<SignInWithGoogleEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await authRepository.signInWithGoogle();
        final _user = FirebaseAuth.instance.currentUser!;

        Map<String, dynamic> userMap =
            await authRepository.getUser(_user.email!);
        emit(AuthenticatedState(userMap: userMap));
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticatedState());
      }
    });
    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    on<SignOutEvent>((event, emit) async {
      emit(LoadingState());
      await authRepository.signOut();
      emit(UnAuthenticatedState());
    });
    on<CheckedSignInEvent>((event, emit) async {
      Map<String, dynamic> userMap = await authRepository.getUser(event.email);
      emit(AuthenticatedState(userMap: userMap));
    });
    on<LoadInforEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final _user = FirebaseAuth.instance.currentUser!;
        Map<String, dynamic> userMap =
            await authRepository.getUser(_user.email!);
        emit(AuthenticatedState(userMap: userMap));
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticatedState());
      }
    });
    on<UpdateNameEvent>((event, emit) async {
      try {
        await authRepository.updateName(name: event.fullName);
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticatedState());
      }
    });

    on<UpdatePhoneNumberEvent>((event, emit) async {
      try {
        await authRepository.updatePhoneNumber(phoneNumber: event.phoneNumber);
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticatedState());
      }
    });
    on<UpdateAvatarEvent>((event, emit) async {
      try {
        await authRepository.getImage();
        add(LoadInforEvent());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticatedState());
      }
    });
  }
}
