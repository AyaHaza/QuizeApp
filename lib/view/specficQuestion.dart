
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../model/QuizeModel.dart';
import 'package:flutter/material.dart';
import '../core/constant.dart';
import 'ScorPage.dart';

class SpecficQuestion extends StatelessWidget {
  ValueNotifier<Color> colorButton = ValueNotifier(colors.secandry);

  SpecficQuestion({required this.quizModel});
  QuizModel quizModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text("Question "+"${quizModel.id}"),
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
                    alignment: Alignment.topRight,
                    child: Image.asset('images/thunderbolt 1.png',scale: 0.7,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:660),
                    child: Image.asset('images/thunderbolt 1.png',scale: 0.7,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:100,left: 20,right: 20,bottom: 24),
                    child: Container(
                        height: 520,
                        width: 880.w,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 48.0),
                              child: Container(
                                height: 100,width: 300,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: colors.secandry  ,
                                          spreadRadius: 0.5,
                                          blurRadius: 4
                                      )
                                    ],
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
                                  child: Center(child: Text(quizModel.question))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  itemCount: quizModel.answers.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: (){
                                        if(index==quizModel.correctAnswer){
                                          colors.correctAnswers++;
                                          colorButton.value=Colors.green;
                                          const snackBar = SnackBar(backgroundColor: Colors.green,
                                            duration: Duration(seconds: 2),
                                            content: Text('Correct Answer!'),
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          }else{
                                          const snackBar = SnackBar(backgroundColor: Colors.red,
                                            duration: Duration(seconds: 1),
                                            content: Text('Wrong Answer! Try Again '),
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        }
                                      },
                                      child: ValueListenableBuilder(
                                        valueListenable: colorButton,
                                        builder: (context, value, _) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: (index==quizModel.correctAnswer)?value:colors.secandry,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color(0x34000000)  ,
                                                      spreadRadius: 0.5,
                                                      blurRadius: 4
                                                  )
                                                ]
                                            ),
                                            margin: EdgeInsets.only(bottom: 10,left: 50,right: 50),
                                            child: ListTile(
                                              title: Center(child: Text(quizModel.answers[index])),
                                            ),
                                          );
                                        },
                                      )
                                    );} ),
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 240.0.w,top:700),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => ScorePage()));
                      },

                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 10,bottom: 40),
                          height: 50,
                          width: 480.w,
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
                          child: Text('Score',style: TextStyle(fontSize: 22,color: Colors.white),) ),
                    ),
                  ),
                ])) );

  }
}
