import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constant/app_image.dart';
import 'package:movie_app/constant/app_text.dart';
import 'package:movie_app/core/service/injector.dart';
import 'package:movie_app/view/homepage/homepage_screen.dart';
import 'package:movie_app/view/homepage/viewmodel/index/index_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToHomepage();
    super.initState();
  }

  goToHomepage() async {
    await Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => di.get<IndexCubit>(),
              child: const HomepageScreen(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageSize = size.width / 2.5;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: imageSize,
              height: imageSize,
              child: Image.asset(
                AppImage.icon,
                width: imageSize,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              AppText.appName,
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
