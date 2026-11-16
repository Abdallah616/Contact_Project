import 'package:contact/core/gen/assets.gen.dart';
import 'package:contact/modules/home/view/home_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  static const String routeName = '/splash_view';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeView.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 39),
          child: Assets.images.splashImg.image(),
        ),
      ),
    );
  }
}
