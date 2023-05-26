import 'package:empresas/configs/colors.dart';
import 'package:empresas/features/auth_tef/2_application/widgets/alert_card.dart';
import 'package:empresas/features/auth_tef/2_application/widgets/custom_app_bar.dart';
import 'package:empresas/features/auth_tef/2_application/widgets/custom_card_button.dart';
import 'package:empresas/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SelectStatusAccountPage extends StatelessWidget {
  const SelectStatusAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SelectStatusAccountView();
  }
}

class _SelectStatusAccountView extends StatelessWidget {
  const _SelectStatusAccountView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Autorizar transferencias'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const _ImageTef(),
              const SizedBox(
                height: 24,
              ),
              const Text(
                '¿Qué transferencias autorizará?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Seleccione una opción para filtrar las transferencias pendientes de autorización',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 48,
              ),
              CustomCardButton(
                cardTitle: 'Sin autorización',
                onTap: () {
                  
                },
              ),
              CustomCardButton(
                cardTitle: 'Pendientes de otra autorización',
                onTap: () {},
              ),
              const SizedBox(
                height: 32,
              ),
              const AlertCard(
                mainText: 'El límite de monto máximo diario para transferencias a terceros es ', 
                alertCardType: AlertCardType.info,
                childrenText: [
                  TextSpan(
                    text: '\$14.999.999',
                    style: TextStyle(fontWeight: FontWeight.bold)
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class _ImageTef extends StatefulWidget {
  const _ImageTef();

  @override
  State<_ImageTef> createState() => _ImageTefState();
}

class _ImageTefState extends State<_ImageTef>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    // _startRotation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startRotation() async {
    while (true) {
      // await Future.delayed(Duration(seconds: 2));
      await _animationController.animateBack(0,
          duration: const Duration(seconds: 3));
      await _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 82,
          child: Center(
              child: SvgPicture.asset(
            'assets/images/auth_tef/circle_tef_img.svg',
            width: 82,
            height: 82,
          )),
        ),
        RotationTransition(
          turns: Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
              parent: _animationController, curve: Curves.elasticInOut)),
          child: SizedBox(
            height: 82,
            child: Center(
                child: SvgPicture.asset(
              'assets/images/auth_tef/icon_tef_img.svg',
              width: 56,
              height: 56,
            )),
          ),
        )
      ],
    );
  }
}
