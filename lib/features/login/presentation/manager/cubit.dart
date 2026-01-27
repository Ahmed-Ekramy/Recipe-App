import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/login/presentation/manager/states.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context)=> BlocProvider.of(context);
  
  bool isPassword=true;
  void visibilityIcon(){
    isPassword=!isPassword;
    emit(VisibilityIconState());
  }

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  
  void requestPasswordFocus() {
    passwordFocusNode.requestFocus();
  }
  
  @override
  Future<void> close() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    return super.close();
  }
}