import 'package:chatapp/Share/Components/components.dart';
import 'package:flutter/material.dart';

import '../../Share/Components/constant.dart';
import 'SignUp_page.dart';

class LoginScreen extends StatelessWidget {

  String id = 'LoginScreenPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  height: 250,
                  child: Image.asset('assets/icon/chat-10-removebg-preview.png'),
                ),
                Container(
                  height: 420,
                  decoration: BoxDecoration(

                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],

                  ),
                  padding: EdgeInsets.only(
                    top: 20,
                    right: 10,
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Welcome And Sign Up

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Welcome,',
                            fontsize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          GestureDetector(
                            onTap: (){

                              Navigator.pushNamed(context,SignUpScreen().id);

                            },
                            child: CustomText(
                              text: 'SignUp',
                              fontsize: 18,
                              fontWeight: FontWeight.w400,
                              color: Primarycolor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: 'Sign in to Continue',
                        fontsize: 14,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 56,
                      ),
                      InputForm(
                        type: TextInputType.emailAddress,
                        text: 'Email',
                        color: Colors.grey,
                        iconPrefex: Icons.email_outlined,
                        hint: 'email@example.com',
                        onsave: (value) {},
                        onvalidate: (value) {},
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InputForm(
                        type: TextInputType.visiblePassword,
                        text: 'Passsword',
                        color: Colors.grey,
                        iconPrefex: Icons.lock,
                        iconSuffex: Icons.visibility,
                        hint: '**************',
                        onsave: (value) {},
                        onvalidate: (value) {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: 'Forget Password?',
                        fontsize: 14,
                        alignment: Alignment.topRight,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButtom(
                        onpressed: () {},
                        text: 'SIGN IN',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
