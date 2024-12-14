import 'dart:ui';

import 'package:chat_app/models/messege.dart';
import 'package:chat_app/screens/chat_screen/chat_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Widgets/chat buble.dart';
import '../../Widgets/constance.dart';


class ChatPadge extends StatelessWidget {
  static String id = 'chatpadge';

  final ScrollController _controller = ScrollController();
  TextEditingController controller = TextEditingController();
  List<Message> massagesList = [];

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Chat', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if(state is ChatSuccess){
                  massagesList = state.messegeList;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: massagesList.length,
                    itemBuilder: (context, index) {
                      return massagesList[index].id == email
                          ? ChatBuble_category(
                        message: massagesList[index],
                      )
                          : ChatBuble_for_frind(
                        message: massagesList[index],
                      );
                    }
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context).sendMassage(massage: data, email: email);
                BlocProvider.of<ChatCubit>(context).getMassege();

                controller.clear();
                _scrollDown();
              },
              decoration: InputDecoration(
                  hintText: 'Send Massege',
                  suffixIcon: const Icon(Icons.send, color: kPrimaryColor,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: kPrimaryColor,
                    ),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }


  void _scrollDown() {
    _controller.animateTo(
      0,
      // _controller.position.maxScrollExtent,
      duration: const Duration(seconds: 3),
      curve: Curves.fastOutSlowIn,
    );
  }
}


