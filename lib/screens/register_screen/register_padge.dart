import 'package:chat_app/screens/login_screen/login_cubit.dart';
import 'package:chat_app/screens/register_screen/register_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../Categry/Textfieldcatogry.dart';
import '../../Categry/bottom category.dart';
import '../../Widgets/constance.dart';
import '../../cubits/authe_cubit.dart';
import '../../helps/show_snakbar.dart';
import '../chat_screen/Chat_padge.dart';
import '../login_screen/login_padge.dart';

class Register_padge extends StatefulWidget {
  Register_padge({super.key});

  static String id = 'Registerpadge';

  @override
  State<Register_padge> createState() => _Register_padgeState();
}

class _Register_padgeState extends State<Register_padge> {
  String? email;

  String? password;
  bool isloding = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AutheCubit, AutheState>(
      listener: (context, state) {
       if(state is regsterLoading){
         isloding=true;
       }
       else if (state is regsterSuccess){
         isloding=false;
         showSnackBar(context, 'success');
         Navigator.pop(context);

       }
       else if(state is regsterFailuer) {
         isloding=false;
         showSnackBar(context, state.errormassege);

       }
      },
     builder: (context,state) => ModalProgressHUD(
        inAsyncCall: isloding,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: SafeArea(
            child: Form(
              key: formKey,
              child: ListView(
                  children: [
                    Padding(

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
                            fontWeight: FontWeight.bold,),),
                          SizedBox(height: 50),

                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Register', style: TextStyle(
                                  color: Colors.white, fontSize: 22),),
                            ],
                          ),
                          Textformfaildcatogry(
                            hint: 'Email',
                            onchange: (data) {
                              email = data;
                            },
                          ),
                          Textformfaildcatogry(hint: 'Password',
                            password: true,
                            onchange: (data) {
                              password = data;
                            },
                          ),
                          const SizedBox(height: 10,),
                          category_bottom(
                            ontap: () async {
                              //Navigator.pushNamed(context,  Login_padge.id);
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AutheCubit>(context).regesterUser(email: email!, password: password!);
                              } else {}
                            },

                            text: 'Register',

                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("already  have an account?  ",
                                style: TextStyle(color: Colors.white),),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Login", style: TextStyle(
                                      color: Colors.blueAccent),))

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
