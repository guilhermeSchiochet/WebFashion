import 'package:flutter/material.dart';
import 'package:web_fashion/domain/useCases/validate_email_usecase.dart';
import 'package:web_fashion/presentation/widgets/text_form_field_builder.dart';

class EmailInputField extends StatefulWidget {
  final ValidateEmailUseCase validateEmailUseCase;

  const EmailInputField({Key? key, required this.validateEmailUseCase}): super(key: key);

  @override
  createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {

  final TextEditingController _emailController = TextEditingController();
  
  bool _isValid = true;
  bool _isInitialValidation = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _validateEmail(String email) async {
    final isValid = await widget.validateEmailUseCase(email);
    
    if(isValid != _isValid) {
      setState(() {
        _isValid = isValid;
        _isInitialValidation = true;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return TextFormFieldBuilder(
      onChanged: _validateEmail,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction ,
      errorText: _isInitialValidation && !_isValid ? 'E-mail inválido' : null,
      formatter: const [],
      filled: true,
      fillColor: Colors.grey.shade200,
      hintText: 'Endereço de e-mail',
      hintStyle: const TextStyle(fontSize: 15),
      contentPadding: const EdgeInsets.only(
        left: 7.0,
        top: 15.0,
        bottom: 15.0,
      ),
    );
  }
}