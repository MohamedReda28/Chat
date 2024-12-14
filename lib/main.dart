import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/chat_screen/Chat_padge.dart';
import 'package:chat_app/screens/chat_screen/chat_cubit.dart';
import 'package:chat_app/screens/login_screen/login_cubit.dart';
import 'package:chat_app/screens/register_screen/register_cubit.dart';
import 'package:chat_app/screens/register_screen/register_padge.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Blocs/auth_bluc_bloc.dart';
import 'bloc_observer.dart';
import 'cubits/authe_cubit.dart';
import 'screens/login_screen/login_padge.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides.runZoned(()  {
    runApp(Chat_App());
  },
  blocObserver: SimpleBlocObsever(),
  );
}

class Chat_App extends StatelessWidget {
  Chat_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (context)=>AutheCubit()),
        BlocProvider(create: (context)=>ChatCubit()),
        BlocProvider(create: (context)=>AuthBloc()),

      ],

      child: MaterialApp(
        routes: {
          Login_padge.id: (context) => Login_padge(),
          Register_padge.id: (context) => Register_padge(),
          ChatPadge.id: (context) => ChatPadge(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: Login_padge.id,
      ),
    );
  }
}
