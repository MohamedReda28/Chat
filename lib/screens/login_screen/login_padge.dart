import 'package:chat_app/screens/chat_screen/Chat_padge.dart';
import 'package:chat_app/screens/chat_screen/chat_cubit.dart';
import 'package:chat_app/screens/register_screen/register_padge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../Blocs/auth_bluc_bloc.dart';
import '../../Categry/Textfieldcatogry.dart';
import '../../Categry/bottom category.dart';
import '../../Widgets/constance.dart';
import '../../helps/show_snakbar.dart';


class Login_padge extends StatelessWidget {
  static String id = 'Loginpadge';

  bool isloading = false;

  String? email, password;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
       if(state is loginloading){
         isloading= true;
       }else if(state is loginsuccess) {
         isloading= false;
         showSnackBar(context, 'success');

         Navigator.pushNamed(context, ChatPadge.id,arguments: email);
         BlocProvider.of<ChatCubit>(context).getMassege();


       }else if(state is loginfailuer){
         isloading= false;
         showSnackBar(context, state.errorMassege);


       }
      },
      builder:(context,state)=> ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Form(
            key: formkey,
            child: SafeArea(
              child: ListView(
                  children: [ Padding(

                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 100),
                        const CircleAvatar(
                          radius: 90,
                          backgroundImage: AssetImage('assets/psu-.png'),
                        ),
                        const Text('Scholar Chat', style:
                        TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'pacifico',
                          fontWeight: FontWeight.bold,),),
                        SizedBox(height: 50),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('LOGIN', style: TextStyle(
                                color: Colors.white, fontSize: 22),),
                          ],
                        ),
                        Textformfaildcatogry(
                          hint: 'Email',
                          onchange: (data) {
                            email = data;
                          },
                        ),
                        Textformfaildcatogry(
                            password: true,
                            hint: 'Password',
                            onchange: (data) {
                              password = data;
                            }
                        ),
                        const SizedBox(height: 10,),
                        category_bottom(
                          text: 'Login',
                          ontap: () async {
                            if (formkey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context).add(
                                  LoginEvent(email: email!, password: password!));

                            } else {}
                          },

                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("don't have an account?  ",
                              style: TextStyle(color: Colors.white),),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Register_padge.id);
                                },
                                child: Text("Register",
                                  style: TextStyle(color: Colors.blueAccent),))

                          ],
                        )
                      ],
                    ),
                  ),
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }


}
