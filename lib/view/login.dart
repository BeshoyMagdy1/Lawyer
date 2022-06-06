import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../contriller/con_auth.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);
  final x =Get.put(AuthController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffDA9F5C),
        title: Text('Sign in',style: TextStyle(fontSize: 30),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
          onPressed: () => x.login(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                child: Image.asset("asset/images/google.png"),
              ),
              SizedBox(width: 15),
              Text(
                "Sign In with Google",
                style: TextStyle(fontSize: 20,color: Colors.black),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            elevation: 10,
            primary: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
          ],
        ),
      ),
    );
  }
}
