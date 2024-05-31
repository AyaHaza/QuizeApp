import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/view/Questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/config/get_it_config.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: 446.h,
              width: double.infinity,
              child: Stack(
                children: [
                  SvgPicture.asset('images/bigCir.svg',height: 324),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0,left: 54),
                    child: SvgPicture.asset('images/bigCir4.svg',height: 280),
                  ),
                  SvgPicture.asset('images/bigCir1.svg',height: 112,),
                  Padding(
                    padding: const EdgeInsets.only(top: 148.0,left: 30),
                    child: SvgPicture.asset('images/bigCir2.svg',height: 50,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0,left: 288),
                    child: SvgPicture.asset('images/bigCir3.svg',height: 20,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 110.0,left: 150),
                    child: Text('LOGIN',style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700,color: Color(0xFF914576)),),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30,top: 102),
              height: 80.h,
              width: 340.spMax,
              child: TextFormField(
                controller: _textEditingController,
                onChanged: (value){
                  _textEditingController.text=value ;
                  print(value);
                },
                cursorColor: Color(0xFF914576),
                style: TextStyle(color: Color(0xFF914576),),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.email,color: Color(0xFF914576),),
                  ),
                  hintText: "userName",
                  hintStyle: TextStyle(color:Color(0xFF914576) ),
                  focusColor: Color(0xFF914576),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF914576),width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF914576),width: 2), borderRadius: BorderRadius.circular(30)

                  ),
                ),
              ),
            ),
           InkWell(
              onTap: () {
                core.get<SharedPreferences>().setString('userName', _textEditingController.text);
                SnackBar snackBar = SnackBar(backgroundColor: Color(0xFFF3BD6B),
                  duration: Duration(seconds: 2),
                  content: Text("Welcome  " "${_textEditingController.text}" " To Quize App"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },

              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 30,bottom: 40,top: 50),
                  height: 60.h,
                  width: 340.spMax,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFDA8BD9),
                            Color(0xFFF3BD6B),
                          ]
                      )
                  ),
                  child: Text('LOGIN',style: TextStyle(fontSize: 22,color: Colors.white),) ),
            ),
            Container(
              // color: Colors.cyan,
              margin: EdgeInsets.only(top: 50),
              height: 154.h,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 288.0,top: 20),
                child: Image.asset(alignment: Alignment.bottomRight,'images/downImg.png',height: 324.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
