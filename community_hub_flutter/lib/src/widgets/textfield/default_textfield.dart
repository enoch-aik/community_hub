


import 'package:community_hub/lib.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? emptyTextError;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;

  const DefaultTextFormField(
      {Key? key,
      this.controller,
      this.label,
      this.validator,
      this.hint,
      this.helperText,
      this.maxLines,
      this.emptyTextError,this.keyboardType,this.autofillHints,
      this.minLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(/*
      maxLines: maxLines,
      minLines: minLines,*/
      controller: controller,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return emptyTextError;
            }
            return null;
          },
      autofillHints: autofillHints,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding:  EdgeInsets.symmetric(horizontal: 8.w),
          hintText: hint,
          labelText: label,
          helperText: helperText),
    );
  }
}
