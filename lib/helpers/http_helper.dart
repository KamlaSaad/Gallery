import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import 'cache_helper.dart';

class HttpHelper{
  static initHeader(){
    String token=CacheHelper.getData(name: "token"),
        lang=CacheHelper.getLang();

    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Accept-Language': lang,
      'Authorization':'Bearer $token',
    };
  }
  static handleException(e){
    if(kDebugMode){
      print("Error $e");
    }
    String msg="$e".toLowerCase();
    if(msg.contains("network")||msg.contains("timed out")||
        msg.contains("connection") || msg.contains("host lookup")){
      return "Bad Network";
    }else{
      return "Something Went Wrong";
    }
  }

  static request ({required String url, body,String? method,String? fileName,String? filePath})async{
    try{
      Map<String, String> headers=initHeader();
      if(kDebugMode){
        print("${Constant.baseUrl}$url");
        print(body);
      }
      var request = http.MultipartRequest(method??'POST', Uri.parse("${Constant.baseUrl}$url"));
      if(body!=null){
        request.fields.addAll(body);
      }
      if(filePath!=null){
        request.files.add(await http.MultipartFile.fromPath(fileName??"image", filePath));
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data=await response.stream.bytesToString();
        if(kDebugMode){
          print(jsonDecode(data));
        }
        return jsonDecode(data);
      }
      else {
        if(kDebugMode){
          print("Error :: ${response.reasonPhrase} ::");
        }
        return "Something Went Wrong";
      }
    }catch(e){
      return handleException(e);
    }

  }
}