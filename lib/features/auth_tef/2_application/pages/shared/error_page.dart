import 'package:empresas/configs/colors.dart';
import 'package:empresas/features/auth_tef/2_application/widgets/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final String? titlePage;
  final String? titleError;
  final String? subtitleError;
  const ErrorPage({
    super.key,
    required this.titlePage,
    required this.titleError,
    required this.subtitleError,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: titlePage ?? 'Ups!'),
      body: ErrorPageContent(titleError: titleError, subtitleError: subtitleError),
    );
  }
}

class ErrorPageContent extends StatelessWidget {
  const ErrorPageContent({
    super.key,
    required this.titleError,
    required this.subtitleError,
  });

  final String? titleError;
  final String? subtitleError;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 71, bottom: 31),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/alert-icon.svg',
                      width: 45,
                      height: 45,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    titleError ?? 'Error inesperado',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    subtitleError ?? 'Ha ocurrido un error inesperado, vuelva a intentarlo mas tarde',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: FilledButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0,
            ),
            onPressed: () {
              context.pop();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 11),
              child: Text(
                'Volver',
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.w700, 
                ),
              ),
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 35),
          child: TextButton(
            onPressed: () {
              context.pushReplacement('/home');
            }, 
            child: const Text(
              'Ir al inicio',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.accentColor
              ),
            )
          ),
        )
      ],
    );
  }
}