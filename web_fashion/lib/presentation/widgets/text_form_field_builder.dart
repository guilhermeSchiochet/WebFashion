import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldBuilder extends StatelessWidget {

  final String title;
  final bool? filled;
  final int? maxLines;
  final bool readOnly;
  final Widget? prefix;
  final Color? fillColor;
  final String? hintText;
  final String? errorText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter> formatter;
  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator<String>? validator;
  final InputBorder? border;

  const TextFormFieldBuilder({
    Key? key,
    this.filled,
    this.prefix,
    this.fillColor,
    this.border,
    this.maxLines,
    this.errorText,
    this.labelText,
    this.onSaved,
    this.hintText,
    this.validator,
    this.onChanged,
    this.contentPadding,
    this.hintStyle,
    this.title = '',
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.autovalidateMode,
    this.readOnly = false,
    this.formatter = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return title.isNotEmpty ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _getFormField
      ],
    ) : _getFormField;
  }

  Widget get _getFormField {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isCollapsed: true,
        prefixIcon: prefix,
        fillColor: fillColor,
        hintText: hintText,
        filled: filled,
        hintStyle: hintStyle,
        labelText: labelText,
        errorText: errorText,
        contentPadding: contentPadding,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 35,
          minHeight: 27,
        ),
        enabledBorder: border,
        focusedBorder: border,
      ),
      onSaved: onSaved,
      readOnly: readOnly,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      keyboardType: keyboardType,
      inputFormatters: formatter,
      textInputAction: textInputAction,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
    );
  }
}