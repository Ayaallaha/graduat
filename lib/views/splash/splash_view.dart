import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    print('SplashView loaded');
    Timer(Duration(seconds: 3), () => Get.offNamed(AppRoutes.LOGIN));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              'assets/logo.pngg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'app_title'.tr,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}