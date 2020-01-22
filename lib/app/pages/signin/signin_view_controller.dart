import 'package:flutter/material.dart';
import 'package:k_central_app/app/pages/signin_page.dart';
import 'package:k_central_app/store/signin/signin_controller.dart';
import 'package:provider/provider.dart';

class SigninViewController extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Provider<SigninController>(
    create: (_) => SigninController(),
    child: Scaffold(
      body: SigninPage(),
    ),
  ); 
}
