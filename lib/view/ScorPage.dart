import '/core/config/get_it_config.dart';
import '/services/QuizService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constant.dart';
class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text("Score "),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 240.0,top:1),
                    child: Image.asset('images/thunderbolt 1.png',scale: 0.7,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:660),
                    child: Image.asset('images/thunderbolt 1.png',scale: 0.7,),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:60,left: 20,right: 20,bottom: 24),
                          child: Container(
                              height: 660,
                              width: 380,
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
                              child: Column(

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 48.0),
                                    child: Text(core.get<SharedPreferences>().getString('userName')!,style: TextStyle(fontSize: 40),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 48.0),
                                    child: Text("Total Questions ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(quizes!.length.toString()),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(48.0),
                                    child: Text("How Many You Answers Correct ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                  ),
                                  Text(colors.correctAnswers.toString())
                                ],
                              )
                          
                          ) )])


                ])
        )
    );

  }
}
