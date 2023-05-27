import 'package:flutter/material.dart';
import 'package:web_fashion/data/repository/regex_repository.dart';
import 'package:web_fashion/domain/useCases/validate_email_usecase.dart';
import 'package:web_fashion/presentation/widgets/formField/email_input_field.dart';
import 'package:web_fashion/presentation/widgets/text_form_field_builder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late final ValidateEmailUseCase validateEmailUseCase;

  @override
  void initState() {
    final regexRepository = RegexRepositoryImpl();
    validateEmailUseCase = ValidateEmailUseCase(regexRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.60,
          width: MediaQuery.of(context).size.width * 0.25,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300
              )
            ],
            border: Border.all(
              color: Colors.grey.shade200,
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: _buildImageLogo()),
                const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 31
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _campos(),
                const SizedBox(
                  height: 20,
                ),
                container_(),
                const SizedBox(
                  height: 20,
                ),
                _buildWidgetPrivacidade(),
                const SizedBox(
                  height: 20,
                ),
                _buttonLogin(),
                const SizedBox(
                  height: 40,
                ),
                _containerRegister()
              ],
            )
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetPrivacidade() {
    return const Text(
      'Ao fazer login, você concorda com a Política de privacidade e com os Termos de uso do Starkzhx.com.br.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12
      ),
    );
  }

  Widget _buildImageLogo() {
    return SizedBox(
      width: 50,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image.asset(
          'assets/png/logotipo.png',
          width: 60,
          height: 60,
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20)),
        elevation: const MaterialStatePropertyAll(5),
        surfaceTintColor: MaterialStatePropertyAll(Colors.grey.shade200),
        overlayColor: MaterialStatePropertyAll(Colors.grey.shade300),
        foregroundColor: MaterialStatePropertyAll(Colors.grey.shade200),
        iconColor: MaterialStatePropertyAll(Colors.grey.shade200),
        backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200),
        shadowColor: MaterialStatePropertyAll(Colors.grey.shade300),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          color: Colors.grey
        ),
      ),
    );
  }

  Widget container_() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _checkBox(),
        _containerForgotPassWord()
      ],
    );
  }

  Widget _containerForgotPassWord() {
    return _registerButton('Forgot password?') ;
  }

  Widget _containerRegister() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account?',
          style: TextStyle(
            color: Color.fromARGB(255, 12, 12, 12),
          ),
        ),
        _registerButton('Register')
      ],
    );
  }

  Widget _registerButton(String text) {
    return TextButton(
      onPressed: () {
        // Ação quando o botão "Register" for clicado
      },
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _checkBox() {
    ValueNotifier<bool> valueNotifier = ValueNotifier(false);

    return Row(
      children: [
        Transform.scale(
          scale: 1,
          child: ValueListenableBuilder(
            builder: (context, value, child) => Checkbox(
              activeColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
              ),
              value: valueNotifier.value,
              onChanged: (e) {
                valueNotifier.value = e ?? false;
              }
            ),
            valueListenable: valueNotifier,
          ),
        ),
        const Text('Remeber me')
      ],
    );
  }

  Widget _campos() {
    return Column(
      children: [
        EmailInputField(
          validateEmailUseCase: validateEmailUseCase
        ),
        const SizedBox(
          height: 20,                  
        ),
        TextFormFieldBuilder(
          filled: true,
          hintText: 'Senha',
          fillColor: Colors.grey.shade200,
          hintStyle: const TextStyle(fontSize: 15),
          contentPadding: const EdgeInsets.only(
            left: 7.0,
            top: 15.0,
            bottom: 15.0,
          ),
        ),
      ],
    );
  }

}