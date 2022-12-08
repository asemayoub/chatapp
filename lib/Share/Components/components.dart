import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

import 'constant.dart';

// Custom Text
class CustomText extends StatelessWidget {
  @required
  String? text;

  @required
  double? fontsize;

  late final Color? color;

  late final FontWeight? fontWeight;

  late final AlignmentGeometry? alignment;

  CustomText(
      {this.text, this.fontsize, this.fontWeight, this.color, this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        '$text',
        style:
            TextStyle(fontSize: fontsize, fontWeight: fontWeight, color: color),
      ),
    );
  }
}

// Custom InputForm

class InputForm extends StatelessWidget {
  late final bool? obsecure;
  late final String? text;
  late final Color? color;
  late final String? hint;
  late final IconData? iconPrefex;
  late final IconButton? iconSuffex;
  late final IconData? setIcon;
  VoidCallback? suffexclick;
  late final Function(String?)? onsave;
  late final String? Function(String?)? onvalidate;
  late final IconData? iconstart;
  late final TextInputType? type;
  late final Function(String?)? onsubmit;
  late final Function(String)? onchange;


  InputForm({
    this.text,
    this.hint,
    this.onsave,
    this.onvalidate,
    this.iconstart,
    this.color,
    this.type,
    this.onsubmit,
    this.iconPrefex,
    this.iconSuffex,
    this.onchange,
    this.obsecure,
    this.suffexclick,
    this.setIcon,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: '$text',
            color: color,
            fontWeight: FontWeight.w400,
          ),
          TextFormField(
            obscureText: obsecure!,
            onChanged: onchange,
            keyboardType: type,
            onFieldSubmitted: onsubmit,
            onSaved: onsave,
            validator: onvalidate,
            decoration: InputDecoration(
              hintText: '$hint',
              prefixIcon: Icon(iconPrefex),
              suffixIcon: IconButton(onPressed: suffexclick, icon: Icon(setIcon)),
              hintStyle: TextStyle(
                color: Colors.grey[400],
              ),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Buttom

class CustomButtom extends StatelessWidget {
  String? text;
  Function()? onpressed;

  CustomButtom({
    required this.onpressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      padding: EdgeInsets.all(15),
      child: CustomText(
        text: '$text',
        alignment: Alignment.center,
        color: Colors.white,
        fontsize: 14,
      ),
      color: Primarycolor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        // side: BorderSide(
        //   color: Colors.teal,
        //   width: 2.0,
        // ),
      ),
    );
  }
}

// Custom ٍSign Buttom

class CustomSignButtom extends StatelessWidget {
  @required
  Function()? onpressed;

  late final String? image;

  @required
  String? text;

  CustomSignButtom({
    this.text,
    this.onpressed,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: HexColor('#DDDDDD'),
        ),
      ),
      child: MaterialButton(
        onPressed: onpressed,
        child: Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Image.asset('$image'),
            SizedBox(
              width: 60,
            ),
            CustomText(
              text: '$text',
              fontsize: 14,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class IconClick extends StatelessWidget {
  IconClick({Key? key}) : super(key: key);

  @required VoidCallback? ontap;

  @required IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(onPressed: ontap,icon: Icon(icon)),

    );
  }

}

