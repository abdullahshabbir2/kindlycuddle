
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class UserIdStore extends Cubit<String>
{
  UserIdStore() : super( '' );

  setUserId(String id){
    emit(id);

    debugPrint(id);

    debugPrint('id saved successfully');
  }

}