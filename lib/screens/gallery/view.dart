import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/screens/gallery/cubit.dart';
import 'package:gallery/utils/constants.dart';
import 'package:gallery/widgets/gallery/gallery_list.dart';
import 'package:gallery/widgets/gallery/upload_dialog.dart';
import 'package:gallery/widgets/text_widget.dart';
import 'package:gallery/widgets/gallery/upload_button.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imgs/gellary-bg.png"),
              fit: BoxFit.cover
            )
          ),
          child: OfflineBuilder(
            connectivityBuilder: (BuildContext context, ConnectivityResult value, Widget child) {
              bool online=value!=ConnectivityResult.none;
              final cubit=GalleryCubit.get(context);
              if(online){
                cubit.getData();
              }
              return BlocBuilder<GalleryCubit,GalleryState>(
                builder: (context,state) {
                  return Column(
                    children: [
                      SizedBox(height: 20.h,),
                      //********************Welcome
                      ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(top: 19.h),
                          child: TextWidget(
                            text: "Welcome \n${cubit.username}",
                            fontFamily: "baloo",
                            weight: FontWeight.normal,
                            lineHeight: 1.1,
                            size: 32.sp,
                          ),
                        ),
                        trailing: CircleAvatar(
                          radius: 33.r,
                          backgroundColor: Constant.greyLight,
                          backgroundImage: const AssetImage("assets/imgs/user.png"),
                        ),
                      ),
                      SizedBox(height: 40.h,),

                      //**********************Actions
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          UploadButton(
                            text: "log out",
                            icon: Icons.arrow_back,
                            colors: const [Color(0xffC83B3B),Color(0xffFB4949)],
                            tap: ()=>cubit.logout()
                          ),
                          UploadButton(
                            text: "upload",
                            icon: Icons.arrow_upward,
                            colors: const [Color(0xffFFEB38),Color(0xffFF9900)],
                            tap: (){
                              uploadDialog(upload: (src)=>cubit.pickImage(src));
                            }
                          )
                        ],
                      ),
                      SizedBox(height: 30.h,),

                      //***********************Gallery
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28.w),
                          child: Center(
                            child: cubit.data.isNotEmpty?
                               GalleryList(data: cubit.data)
                               :state is LoadingState?const CircularProgressIndicator():
                               TextWidget(text: !online?"No Internet":state is ErrorState?state.err:"No Images Yet")
                            ,
                          ),
                        ),
                      )
                    ],
                  );
                }
              );
            },child: const SizedBox(),
          ),
        ),
      ),
    );
  }
}
