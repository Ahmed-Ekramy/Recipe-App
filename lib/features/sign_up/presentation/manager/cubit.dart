import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/features/sign_up/presentation/manager/states.dart';

class SignUpCubit extends Cubit<SignUpState>{
  SignUpCubit() : super(SignUpInitialState());
  static SignUpCubit get(context)=> BlocProvider.of(context);
  
  bool isPassword = true;
  bool isConfirmPassword = true;
  
  void togglePasswordVisibility(){
    isPassword = !isPassword;
    emit(VisibilityPasswordIconState());
  }
  
  void toggleConfirmPasswordVisibility(){
    isConfirmPassword = !isConfirmPassword;
    emit(VisibilityConfirmPasswordIconState());
  }

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  
  void requestEmailFocus() {
    emailFocusNode.requestFocus();
  }
  
  void requestPasswordFocus() {
    passwordFocusNode.requestFocus();
  }
  
  void requestConfirmPasswordFocus() {
    confirmPasswordFocusNode.requestFocus();
  }
  
  @override
  Future<void> close() {
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    return super.close();
  }
}
