import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'validate_state.dart';

class ValidateCubit extends Cubit<ValidateState> {
  ValidateCubit() : super(ValidateState(isValid: false,error: ""));

  String nickName = "UZB";
  TextEditingController controller = TextEditingController();

  void isValid(){
    if(controller.text == nickName){
      emit(ValidateState(isValid: true,error: ""));
    }else if(controller.text.length < 5){
      emit(ValidateState(isValid: false,error: "enter at least 6 word"));
    }else if(controller.text == "qwerty"){
      emit(ValidateState(isValid: false, error: "Invalid name"));
    }
  }



}
