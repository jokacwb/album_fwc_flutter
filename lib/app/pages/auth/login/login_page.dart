import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/config/env/env.dart';
import 'package:fwc_album/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album/app/core/ui/widgets/button.dart';
import 'package:fwc_album/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:fwc_album/app/pages/auth/login/view/login_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  const LoginPage({super.key, required this.presenter});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'), fit: BoxFit.cover, //preenche toda a tela
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * (MediaQuery.of(context).size.width > 350 ? .30 : .25),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: Text(
                          'Login',
                          style: context.textStyles.titleWhite,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: emailEC,
                      validator: Validatorless.multiple([Validatorless.required('Email deve ser informado'), Validatorless.email('Email inválido!')]),
                      decoration: const InputDecoration(label: Text('E-Mail'), floatingLabelBehavior: FloatingLabelBehavior.never),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha deve ser informada'),
                        Validatorless.min(6, 'Senha inválida!'),
                      ]),
                      decoration: const InputDecoration(label: Text('Senha'), floatingLabelBehavior: FloatingLabelBehavior.never),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ButtonCustom(
                      width: MediaQuery.of(context).size.width * .9,
                      height: 40,
                      onPressed: () {
                        final valid = formKey.currentState?.validate() ?? false;
                        if (valid) {
                          showLoader();
                          widget.presenter.login(emailEC.text, passwordEC.text);
                        }
                      },
                      style: context.buttonStyles.yellowButton,
                      labelStyle: context.textStyles.textSecondaryExtraBoldPrimaryColor,
                      label: 'Login',
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    Visibility(
                      visible: ((Env.instance['isPermitRegister'] ?? 'false') == 'true'),
                      child: Text.rich(
                        TextSpan(
                          text: 'Não possui uma conta? ',
                          style: context.textStyles.textSecondaryFontMedium.copyWith(color: Colors.white),
                          children: [
                            TextSpan(
                              text: 'Cadastre-se',
                              style: context.textStyles.textSecondaryFontMedium.copyWith(
                                color: context.colors.yellow,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () => Navigator.of(context).pushNamed('/auth/register'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}