import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:gallery/widgets/snack_bar.dart';
import '../../../helpers/http_helper.dart';
import '../../helpers/cache_helper.dart';
import '../../models/user.dart';
part 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitState());
  static LoginCubit get(context) => BlocProvider.of(context);
  final email=TextEditingController();
  final password=TextEditingController();
  final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");


  validateData() {
    String emailVal=email.text.trim();
    if (emailVal.isEmpty) {
      return "Enter Your Email";
    } else if (!emailRegex.hasMatch(emailVal)) {
      return "Enter a valid Email";
    }else if(password.text.trim().isEmpty){
      return "Enter your password";
    }else{
      return "";
    }
  }

  login()async{
    String msg=validateData();
    if(msg.isNotEmpty){
      snackBar(msg: msg);
    }else{
      emit(LoggingState());
      UserModel userModel=UserModel(email: email.text,password: password.text);
      var result = await HttpHelper.request(url: "auth/login",body: userModel.toJson());
      if (result == "Bad Network!" || result == null|| result == "Something Went Wrong" ) {
        emit(ErrorState(err: result??"Something Went Wrong"));
      } else if (result['user']!=null) {
        CacheHelper.saveUserData(data: result['user'],token: result['token']);
        emit(SuccessState());
      }else{
        emit(ErrorState(err: result["error_message"]??"Something Went Wrong"));
      }
    }
  }
  

}
