import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/helpers/cache_helper.dart';
import 'package:gallery/screens/gallery/cubit.dart';
import 'package:gallery/screens/gallery/view.dart';
import 'package:gallery/screens/login/view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    String token=CacheHelper.getData(name: "token");
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(360, 690),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context) =>GalleryCubit()..init()),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return Directionality(
                textDirection:TextDirection.ltr,
                child: child!,
              );
            },
            home: token.isEmpty?const LoginScreen():const GalleryScreen(),
            // getPages: routes,
          ),
        );
      },

    );
  }
}

