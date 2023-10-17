import 'package:flutter/material.dart';

//-----------------------------Azeem Code --------------------------------

class CtextField extends StatelessWidget {
  final TextEditingController controller;
  Widget? label, icon;
  String? hint;
   CtextField({Key? key,
    this.label,this.icon,
     this.hint,
    required this.controller,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value == null) {
            return "Required";
          }else if(value.length < 5){
            return "length is smaller then 5 char";
          }
        } ,
        controller: controller,
        decoration: InputDecoration(
          label:label, 
          icon: icon,
          hintText: hint,
        ),
        
      ),
    );
  }
}
