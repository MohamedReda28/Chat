import 'package:flutter/material.dart';
class category_bottom extends StatelessWidget {
   category_bottom({this.text,this.ontap});
 String? text;
 VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),

        ),
        child: Center(child: Text(text!,style: TextStyle(fontSize: 25),)),
      ),
    );

  }
}
