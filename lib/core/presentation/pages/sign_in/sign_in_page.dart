import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:demo2/core/presentation/widgets/jtext_field.dart';
import 'package:demo2/core/resources/palette.dart';
import 'package:demo2/core/resources/style.dart';
import 'package:demo2/gen/assets.gen.dart';
import 'package:demo2/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes.dart';
import '../../../../data/services/auth_service.dart';
import '../../widgets/toast_card.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final userNameNode = FocusNode();
  final passwordNode = FocusNode();
  final authService = AuthService();
  final keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    Future<void> _signIn() async {
      setState(() {
        isLoading = true;
      });
      final result = await authService.signIn(
        emailController.text,
        passwordController.text,
      );
      if (result == 'success') {
        setState(() {
          isLoading = false;
          Navigator.pushNamed(context, '/home');
          // NavController.pushReplacementNamed('/home');
        });
      } else {
        DelightToastBar(
          builder: (context) {
            return StyleToastCard(status: false, textTile: lang!.loginFailed );
          },
          position: DelightSnackbarPosition.top,
          autoDismiss: true,
          snackbarDuration: const Duration(seconds: 1),
        ).show(context);
      }
    }
    return Material(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.signUpImg.svg(),
              const SizedBox(height: 20),
              JTextField(
                title: lang!.email,
                controller: emailController,
                focusNode: userNameNode,
                hintText: lang!.enterEmail,
                borderRadius: 12,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: (text) {
                  if (text?.trim().isEmpty ?? true) return lang!.requiredInfor;
                  return null;
                },
              ),
              const SizedBox(height: 20),
              JTextField(
                controller: passwordController,
                focusNode: passwordNode,
                onEditingComplete: () => {},
                borderRadius: 12,
                title: lang?.password,
                hintText: lang.enterPassword,
                inputType: InputType.password,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: (text) {
                  if (text?.trim().isEmpty ?? true) return lang!.requiredInfor;
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  _signIn();
                },
                child: Text(lang!.login),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1, color: Palette.gray100),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    lang.or,
                    style: semiBold14.copyWith(color: Palette.gray100),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Divider(thickness: 1, color: Palette.gray100),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await authService.signInWithGoogle(context);
                },
                style: ButtonStyle().copyWith(
                  backgroundColor: WidgetStatePropertyAll(Palette.white),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.googleIcon.svg(),
                    const SizedBox(width: 5),
                    Text(
                      lang.signInWithGoogle,
                      style: TextStyle(color: Palette.gray600),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    lang.doNotHaveAccount,
                    style: TextStyle(color: Palette.gray600),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                    child: Text(
                      lang.signUpNow,
                      style: bold14.copyWith(color: (Palette.primary)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
