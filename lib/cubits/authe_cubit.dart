import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'authe_state.dart';

class AutheCubit extends Cubit<AutheState> {
  AutheCubit() : super(AutheInitial());
  Future<void>loginUser({required String email , required String password})async {
    emit(loginloading());
    try {
      var auth = FirebaseAuth.instance;
      UserCredential usercredantial = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(loginsuccess());
    } on FirebaseAuthException catch (ex) {
      print('000000000000000$ex');
      if (ex.code == 'user-not-found') {
        emit(loginfailuer(errorMassege: 'user not found'));
      }
      else if (ex.code == 'wrong-password') {
        emit(loginfailuer(errorMassege: 'wrong passward'));
      }
    }
    catch (e) {
      print('1111111111111$e');

      emit(loginfailuer(errorMassege: 'something went wrong'));
    }
  }



  Future<void>regesterUser({required String email,required String password})async{
    emit(regsterLoading());
    try {
      var auth =FirebaseAuth.instance;
      UserCredential usercredantial =await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(regsterSuccess());
    } on FirebaseAuthException catch(e){
      if(e.code =='email-already-in-use'){
        emit(regsterFailuer(errormassege:'email already in use'));
      }
      else if(e.code =='weak-password'){
        emit(regsterFailuer(errormassege:'weak password'));

      }
    }catch(e){
      emit(regsterFailuer(errormassege:'something went wrong'));

    }
  }
}
