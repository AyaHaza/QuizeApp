import '/model/QuizeModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class QuizServic{
  Dio dio=Dio();
  late Response response;
  String baseUrl="https://6654ac681c6af63f4678ea57.mockapi.io/api/questions";
  Future<List<QuizModel>> getAllQuizes();
  Future<bool> addQuize(QuizModel quizModel,BuildContext context);
}
List<QuizModel>? quizes;
class QuizServicImp extends QuizServic{

  @override
  Future<List<QuizModel>> getAllQuizes()async {
   try{
    response=await dio.get(baseUrl);
    print(response.statusCode);
    if(response.statusCode==200){
     quizes= List.generate(response.data.length, (index) => QuizModel.fromJson(response.data[index]));
     print(quizes);
    return quizes!;
    }else{
      return [];
    }
   }catch(e){
    print(e);
    return [];
   }
  }

  @override
  Future<bool> addQuize(quizModel,context) async {
  try{
    response=await dio.post(baseUrl,data: quizModel.toJson());
    print(response.statusCode);
    if(response.statusCode==201){
        quizes!.add(quizModel);
        print(quizes);
        Navigator.pop(context);
      return true;
    }else{
      return false;
    }
  }catch(e){
    print(e);
    return false;
  }
  }
  
}