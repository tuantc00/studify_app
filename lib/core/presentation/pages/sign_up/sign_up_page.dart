import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:demo2/config/language.dart';
import 'package:demo2/core/presentation/widgets/app_bar.dart';
import 'package:demo2/core/presentation/widgets/jtext_field.dart';
import 'package:demo2/core/resources/palette.dart';
import 'package:demo2/core/resources/style.dart';
import 'package:demo2/data/services/auth_service.dart';
import 'package:demo2/gen/assets.gen.dart';
import 'package:demo2/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../widgets/toast_card.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final userNameNode = FocusNode();
  final passwordNode = FocusNode();
  final keyForm = GlobalKey<FormState>();

  void _signUp() async {
    setState(() {
      isLoading = true;
    });
    final result = await authService.signUp(
      emailController.text,
      passwordController.text,
    );
    if (result == 'success') {
      setState(() {
        isLoading = false;
      });
      DelightToastBar(
        builder: (context) {
          return StyleToastCard(status: true, textTile: 'Đăng ký thành công');
        },
        position: DelightSnackbarPosition.top,
        autoDismiss: true,
        snackbarDuration: const Duration(seconds: 1),
      ).show(context);
    } else {
      setState(() {
        isLoading = false;
      });
      DelightToastBar(
        builder: (context) {
          return StyleToastCard(status: false, textTile: 'Đăng ký thất bại');
        },
        position: DelightSnackbarPosition.top,
        autoDismiss: true,
        snackbarDuration: const Duration(seconds: 1),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Material(
      child: Scaffold(
        appBar: BaseAppBar(label: lang!.signUp,inApp: false,),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              JTextField(
                title: lang!.email,
                controller: emailController,
                focusNode: userNameNode,
                hintText: lang.enterEmail,
                borderRadius: 12,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: (text) {
                  if (text?.trim().isEmpty ?? true) return lang.requiredInfor;
                  return null;
                },
              ),
              const SizedBox(height: 20),
              JTextField(
                controller: passwordController,
                focusNode: passwordNode,
                onEditingComplete: () => {},
                borderRadius: 12,
                title: lang.password,
                hintText: lang.enterPassword,
                inputType: InputType.password,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: (text) {
                  if (text?.trim().isEmpty ?? true) return lang.requiredInfor;
                  return null;
                },
              ),
              const SizedBox(height: 20),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                    onPressed: () async {
                      _signUp();
                    },
                    child: Text(lang.signUp),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
