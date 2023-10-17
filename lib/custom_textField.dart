import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_with_team/c_input_formatters.dart';

//-----------------------------Azeem Code --------------------------------

class CtextField extends StatelessWidget {
  final TextEditingController controller;
  Widget? label,picon,sicon;
  String? hint;
  int? maxchar;

   CtextField({Key? key,
    this.label,
     this.picon,
     this.sicon,
     this.hint,
     this.maxchar,
    required this.controller,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Required";
          }else if(value.length < 5){
            return "length is smaller then 5 char";
          }
        } ,
        controller: controller,
        decoration: InputDecoration(
          label:label,
         prefixIcon:picon,
          suffixIcon: sicon,
          hintText: hint,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red))

        ),
        inputFormatters: [LeadingSpaceInputFormatter(),
          LengthLimitingTextInputFormatter(maxchar)

        ],

      ),
    );
  }
}
