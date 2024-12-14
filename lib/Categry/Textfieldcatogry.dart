import 'package:flutter/material.dart';
class Textformfaildcatogry extends StatelessWidget {
   Textformfaildcatogry({required this.hint,this.onchange,this.password=false});
String hint;
Function(String)? onchange;
bool? password;
Function(String)? valid;


   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: password! ,
        validator: (data){
          if(data!.isEmpty){
            return 'field is required';

          }
        },
        style: TextStyle(color: Colors.white),
        onChanged: onchange,
        decoration: InputDecoration(
          hintText:hint ,
            hintStyle: TextStyle(color: Colors.white),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                )
            )
        ),
      ),
    );
  }
}
