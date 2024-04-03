import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/screens/login/view.dart';
import 'package:gallery/utils/constants.dart';
import 'package:gallery/widgets/snack_bar.dart';
import 'package:image_picker/image_picker.dart';
import '../../../helpers/http_helper.dart';
import '../../helpers/cache_helper.dart';
import 'package:get/get.dart';
import '../../widgets/popup.dart';
part 'state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(InitState());
  static GalleryCubit get(context) => BlocProvider.of(context);
  bool dataGet=false;
  List data=[];
  String username="",imgPath="";
  final ImagePicker picker = ImagePicker();

  init(){
    String name=CacheHelper.getData(name: "name");
    username=name.split(" ")[0];
  }

  getData({refresh})async{
    if((dataGet==false || refresh ==true) && state is! LoadingState) {
      emit(LoadingState());
      var result = await HttpHelper.request(url: "my-gallery", method: "GET");
      if (result == "Bad Network!" || result == null ||
          result == "Something Went Wrong") {
        emit(ErrorState(err: result ?? "Something Went Wrong"));
      } else if (result['status'] == "success") {
        dataGet = true;
        data = result['data']['images'];
        emit(LoadedState());
      } else {
        emit(ErrorState(err: result["error_message"] ?? "Something Went Wrong"));
      }
    }
  }
  //************************Upload

  pickImage(ImageSource source)async{
    Get.back();
    final XFile? image = await picker.pickImage(source: source);
    if(image!=null){
      imgPath=image.path;
      if(kDebugMode){
        print(imgPath);
      }
      await uploadImage();
    }
  }

  uploadImage()async{
   loadingMessage("Please wait!");
    var result = await HttpHelper.request(url: "upload", fileName: "img",filePath: imgPath);
    if(Get.isDialogOpen==true){
      Get.back();
    }
    if (result == "Bad Network!" || result == null ||
        result == "Something Went Wrong") {
      snackBar(msg: result??"Something Went Wrong");
    } else if (result['status'] == "success") {
      snackBar(msg: result['message'],bgColor: Constant.blueLight);
      getData(refresh: true);
    } else {
      snackBar(msg:result["error_message"] ?? "Something Went Wrong");
    }
  }

  logout(){
    CacheHelper.removeData();
    dataGet=false;
    data.clear();
    Get.off(const LoginScreen());
  }


}
