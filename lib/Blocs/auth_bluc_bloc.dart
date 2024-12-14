import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_bluc_event.dart';
part 'auth_bluc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthBlucInitial()) {

    on<AuthEvent>((event, emit) async{

      if(event is LoginEvent ){
        emit(loginloading());
        try {
          var auth = FirebaseAuth.instance;
          UserCredential usercredantial = await auth.signInWithEmailAndPassword(
              email: event.email, password:event.password );
          emit(loginsuccess());
        } on FirebaseAuthException catch (ex) {

          if (ex.code == 'user-not-found') {
            emit(loginfailuer(errorMassege: 'user not found'));
          }
          else if (ex.code == 'wrong-password') {
            emit(loginfailuer(errorMassege: 'wrong passward'));
          }
        }
        catch (e) {

          emit(loginfailuer(errorMassege: 'something went wrong'));
        }
      }
      });
  }
}
