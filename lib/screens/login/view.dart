import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/screens/gallery/view.dart';
import 'package:gallery/utils/constants.dart';
import 'package:gallery/widgets/input.dart';
import 'package:gallery/widgets/main_button.dart';
import 'package:gallery/widgets/rich_text.dart';
import 'package:gallery/widgets/snack_bar.dart';
import 'package:gallery/widgets/text_widget.dart';
import 'package:get/get.dart';
import 'cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,
      body: Container(
        height: Constant.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imgs/login.png"),
            fit: BoxFit.fill
          )
        ),
        child: BlocProvider(
          create: (BuildContext context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if(state is SuccessState){
                Get.off(const GalleryScreen());
              }else if(state is ErrorState){
                snackBar(msg: state.err);
              }
            },
            builder: (context, state) {
              final cubit=LoginCubit.get(context);
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 127.h,),
                    RichTextWidget(
                      text: "My\n Gallery",
                      weight: FontWeight.bold,
                      size: 50.sp,
                    ),
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          width: 300.w,
                          margin: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: Constant.greyLight.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20.r)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: 10.h,),
                              TextWidget(
                                text: "Log in",
                                size: 30.sp,
                                color: const Color(0xff4a4a4a),
                                weight: FontWeight.bold
                              ),
                              SizedBox(height: 40.h,),

                              //***********************User Email
                              Input(
                                hint: "Email",
                                controller: cubit.email
                              ),
                              SizedBox(height: 30.h,),

                              //***********************Password
                              Input(
                                hint: "Password",
                                pass: true,
                                controller: cubit.password
                              ),
                              SizedBox(height: 30.h,),

                              //**********************Login Button
                              MainButton(
                                text: "SUBMIT",
                                loading: state is LoggingState,
                                click: () => cubit.login()
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
