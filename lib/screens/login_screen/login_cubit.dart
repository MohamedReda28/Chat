// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:meta/meta.dart';
//
// part 'login_state.dart';
//
// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());
//
//   Future<void>loginUser({required String email , required String password})async {
//     emit(loginloading());
//     try {
//       var auth = FirebaseAuth.instance;
//       UserCredential usercredantial = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       emit(loginsuccess());
//      } on FirebaseAuthException catch (ex) {
//       print('000000000000000$ex');
//       if (ex.code == 'user-not-found') {
//         emit(loginfailuer(errorMassege: 'user not found'));
//       }
//       else if (ex.code == 'wrong-password') {
//         emit(loginfailuer(errorMassege: 'wrong passward'));
//       // }
//      }
//     catch (e) {
//       print('1111111111111$e');
//
//       emit(loginfailuer(errorMassege: 'something went wrong'));
//     }
//   }
// }
