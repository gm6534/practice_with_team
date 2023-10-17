import 'package:flutter/services.dart';

//---------------------Azeem Code--------------------------

class LeadingSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Check if the new value starts with spaces.
    if (newValue.text.startsWith(' ')) {
      // Remove leading spaces by creating a new TextEditingValue.
      final trimmedText = newValue.text.trimLeft();
      final newSelection = TextSelection.collapsed(offset: trimmedText.length);
      return TextEditingValue(
        text: trimmedText,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    // If the new value does not start with spaces, return it as is.
    return newValue;
  }
}
