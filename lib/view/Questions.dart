import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constant.dart';
import '../core/config/get_it_config.dart';
import '../services/QuizService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'addQuestion.dart';
import 'login.dart';
import 'specficQuestion.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            core.get<SharedPreferences>().clear();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
          },
          icon: Icon(Icons.logout),
        ),
        title: const Text("Questions"),
        backgroundColor: colors.secandry,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddQuestion(),));
        },
        child:  Icon(Icons.add,color: Colors.black),
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
              alignment:  Alignment.topRight,
              child: Image.asset('images/thunderbolt 1.png',scale: 0.7,),
            ),
            Padding(
              padding: const EdgeInsets.only(top:660),
              child: Image.asset('images/thunderbolt 1.png',scale: 0.7,),
            ),
             ListView(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    child: FutureBuilder(
                    future: QuizServicImp().getAllQuizes(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_,index){
                            return  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(snapshot.data![index].question),
                                    subtitle: Text(snapshot.data![index].userName),
                                    trailing: IconButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SpecficQuestion(quizModel: snapshot.data![index],),));
                                      },
                                      icon: CircleAvatar(
                                          backgroundColor: colors.secandry,
                                          child: Icon(Icons.arrow_forward_ios_outlined,size: 14,color: Colors.black,)),
                                    ),

                                  ),
                                  Divider(color: colors.secandry,thickness: 1.5,indent: 50,endIndent: 50,)
                                ],
                              ),
                            );
                            });
                      }
                      return Center(child: CircularProgressIndicator(color: colors.secandry));
                    },
                    ) ),
             )])
       ])) );
  }
}
