import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/model/QuizeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constant.dart';
import '../core/config/get_it_config.dart';
import '../services/QuizService.dart';
class AddQuestion extends StatelessWidget {
TextEditingController question=TextEditingController();
TextEditingController answer1=TextEditingController();
TextEditingController answer2=TextEditingController();
TextEditingController answer3=TextEditingController();
TextEditingController answer4=TextEditingController();
TextEditingController correctAnswer=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text("Add Question"),
          backgroundColor: colors.secandry,
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration:  BoxDecoration(
                gradient: colors.radialGradient
            ),
            child: Stack(
                children: [
                  SvgPicture.asset('images/Ellipse 12.svg',height: 154),
                  Align(
                    alignment:Alignment.topRight,
                    child: Image.asset('images/thunderbolt 1.png',scale: 0.7,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:660),
                    child: Image.asset('images/thunderbolt 1.png',scale: 0.7,),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:84,left: 40.w,right: 10,bottom: 24),
                    child: Container(
                        height: 560,
                        width: 1080.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0x51DC8FCF),
                                  Color(0x52EDB184),
                                ]
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(" Enter the question : "),
                      SizedBox(
                          width: 240,
                          child: TextFieldCustomm(question),
                      )
                          ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(" Enter the answer one : "),
                                    SizedBox(
                                      width: 226,
                                      child: TextFieldCustomm(answer1),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(" Enter the answer two : "),
                                    SizedBox(
                                      width: 226,
                                      child: TextFieldCustomm(answer2),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(" Enter the answer three : "),
                                    SizedBox(
                                      width: 222,
                                      child: TextFieldCustomm(answer3),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(" Enter the answer four : "),
                                    SizedBox(
                                      width: 224,
                                      child: TextFieldCustomm(answer4),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(" Enter id correct answer : "),
                                    SizedBox(
                                      width: 220,
                                      child: TextFieldCustomm(correctAnswer),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 210.0.w,top:700),
                    child: InkWell(
                      onTap: () {
                        QuizServicImp().addQuize(QuizModel(question: question.text,answers: [answer1.text,answer2.text,answer3.text,answer4.text],correctAnswer:int.parse(correctAnswer.text),userName: core.get<SharedPreferences>().getString("userName").toString()),context);
                        // Navigator.pop(context);

                        // Navigator.push(
                        //     context, MaterialPageRoute(builder: (_) => QuizeScreen()));
                      },

                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 30,bottom: 40),
                          height: 50,
                          width: 440.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: colors.primary,
                                spreadRadius: 6,
                                blurRadius: 17
                              )
                            ],
                              borderRadius: BorderRadius.circular(30),
                              color: colors.secandry
                          ),
                          child: Text('Add',style: TextStyle(fontSize: 22,color: Colors.white),) ),
                    ),
                  ),
                ])) );
  }
}
Widget TextFieldCustomm(TextEditingController controller){
  return TextField(
    controller: controller,
    onChanged: (value){
      controller.text=value;
      print(value);
    },
    cursorColor: Color(0xFF914576),
    style: TextStyle(color: Color(0xFF914576),),
    decoration: InputDecoration(
      focusColor: Color(0xFF914576),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.secandry,width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.secandry,width: 2),
      ),
    ),
  );
}