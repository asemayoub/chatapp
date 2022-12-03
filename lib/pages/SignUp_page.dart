import 'package:chatapp/Share/Components/components.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../Share/Components/constant.dart';

class SignUpScreen extends StatelessWidget {
  String id = 'SignUpScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(height: 40,),
                Container(
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
                            text: 'SignUp,',
                            fontsize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          GestureDetector(
                            onTap: (){

                              Navigator.pop(context);
                            },
                            child: CustomText(
                              text: 'SignIn',
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
                        text: 'Welcome New User',
                        fontsize: 14,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 56,
                      ),
                      InputForm(
                        type: TextInputType.text,
                        text: 'User Name',
                        color: Colors.grey,
                        iconPrefex: Icons.person,
                        hint: 'User Name',
                        onsave: (value) {},
                        onvalidate: (value) {},
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InputForm(
                        type: TextInputType.emailAddress,
                        text: 'Email',
                        color: Colors.grey,
                        iconPrefex: Icons.email_outlined,
                        hint: 'Email@example.com',
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
                      SizedBox(
                        height: 20,
                      ),
                      CustomButtom(
                        onpressed: () {},
                        text: 'SIGN IN',
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
