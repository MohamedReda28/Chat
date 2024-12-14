// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:meta/meta.dart';
//
// part 'register_state.dart';
//
// class RegisterCubit extends Cubit<RegisterState> {
//   RegisterCubit() : super(RegisterInitial());
//
//   // Future<void>regesterUser({required String email,required String password})async{
//   //   emit(regsterLoading());
//   //   try {
//   //     var auth =FirebaseAuth.instance;
//   //     UserCredential usercredantial =await auth.createUserWithEmailAndPassword(
//   //         email: email, password: password);
//   //     emit(regsterSuccess());
//   //   } on FirebaseAuthException catch(e){
//   //     if(e.code =='email-already-in-use'){
//   //      emit(regsterFailuer(errormassege:'email already in use'));
//   //     }
//   //     else if(e.code =='weak-password'){
//   //       emit(regsterFailuer(errormassege:'weak password'));
//   //
//   //     }
//   //   }catch(e){
//   //     emit(regsterFailuer(errormassege:'something went wrong'));
//   //
//   //   }
//   // }
// }
