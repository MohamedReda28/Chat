import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../Widgets/constance.dart';
import '../../models/messege.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference message = FirebaseFirestore.instance.collection(kmessagecollection);

  void sendMassage({required String massage,required String email}){
    message.add({
      Kmessege:massage,
      kcreateAt: DateTime.now(),
      'id':email
    });
  }



  void getMassege(){
   List<Message>messegeList=[];
    message.orderBy(kcreateAt,descending: true).snapshots().listen((event) {
      for( var doc in event.docs){
        messegeList.add(Message.fromjson(doc));
      }
      emit(ChatSuccess(messegeList:messegeList));
    });
  }


}
