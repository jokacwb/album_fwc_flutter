import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album/app/core/ui/widgets/button.dart';
import 'package:fwc_album/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fwc_album/app/pages/auth/register/view/register_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;

  const RegisterPage({super.key, required this.presenter});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final passwordConfirmEC = TextEditingController();
  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    passwordConfirmEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 106.82,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/bola.png'), fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Cadastrar Usuário',
              style: context.textStyles.titleBlack,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameEC,
                    validator: Validatorless.required('Nome deve ser preenchido!'),
                    decoration: const InputDecoration(label: Text('Nome Completo')),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: Validatorless.multiple([
                      Validatorless.required('Email deve ser informado!'),
                      Validatorless.email('Email deve ser um formato válido!'),
                    ]),
                    controller: emailEC,
                    decoration: const InputDecoration(label: Text('E-Mail')),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha deve ser informada!'),
                      Validatorless.min(6, 'Senha de ter no mínimo 6 posições'),
                    ]),
                    controller: passwordEC,
                    decoration: const InputDecoration(label: Text('Senha')),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha deve ser informada!'),
                      Validatorless.min(6, 'Senha de ter no mínimo 6 posições'),
                      Validatorless.compare(passwordEC, 'Confimação de Senha diferente de Senha!')
                    ]),
                    controller: passwordConfirmEC,
                    decoration: const InputDecoration(label: Text('Confirmação senha')),
                  ),
                  const SizedBox(height: 20),
                  ButtonCustom.primary(
                    height: 40,
                    width: MediaQuery.of(context).size.width * .9,
                    onPressed: () {
                      final valid = formKey.currentState?.validate() ?? false;
                      if (valid) {
                        showLoader();
                        widget.presenter.register(
                          name: nameEC.text,
                          email: emailEC.text,
                          password: passwordEC.text,
                          passwordConfirm: passwordConfirmEC.text,
                        );
                      }
                    },
                    label: 'Cadastrar',
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
