import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {
  final String hint;
  const CustomInput({Key? key, this.maxLength, required this.hint, required this.textEditingController})
      : super(key: key);
  final int? maxLength;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        maxLength: maxLength,
        controller: textEditingController,
        inputFormatters: maxLength == null ? [] : [
          FilteringTextInputFormatter.digitsOnly,
          new CustomInputFormatter()
        ],
        decoration: InputDecoration(
          counterText: '',
          labelText: hint,
          filled: true,
          fillColor: Colors.white,
            border: OutlineInputBorder(
              gapPadding: 10.0,
              borderSide: BorderSide(
                width: 8,
                color: Colors.white,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(10.0,),
            ),
        ),
      ),
    );
  }
}


class CustomInputFormatter extends TextInputFormatter {


  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i == 0) {
        buffer.write('+');
      }

      if (i == 2 || i == 5 || i == 8) {
        buffer.write(' ');
      }

      buffer.write(text[i]);
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length)
    );
  }
}
