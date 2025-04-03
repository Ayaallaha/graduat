import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../routes/app_routes.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('app_title'.tr, style: TextStyle(color: Color(0xff2A629A),),textAlign:TextAlign.center,),
            SizedBox(width: 8),

          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Color(0xff2A629A)),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Text('القائمة')),
            ListTile(
              title: Text('المفضلة'),
              onTap: () => Get.back(),
            ),
            ListTile(
              title: Text('الإعدادات'),
              onTap: () => Get.back(),
            ),
            ListTile(
              title: Text('المساعدة'),
              onTap: () => Get.back(),
            ),
            ListTile(
              title: Text('logout'.tr),
              onTap: () {
                authController.logout();
                Get.back();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomButton(
              text: 'specialties'.tr,
              onPressed: () => Get.toNamed(AppRoutes.SPECIALTIES_LIST),
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'lab_tests'.tr,
              onPressed: () => Get.toNamed(AppRoutes.LAB_TESTS),
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'appointments'.tr,
              onPressed: () => Get.toNamed(AppRoutes.MY_APPOINTMENTS),
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'reviews'.tr,
              onPressed: () => Get.toNamed(AppRoutes.REVIEW_APPOINTMENTS),
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'doctors list'.tr,
              onPressed: () => Get.toNamed(AppRoutes.DOCTORS_LIST),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: homeController.selectedIndex.value,
          selectedItemColor: Color(0xff2A629A),
          unselectedItemColor: Color(0xff7F7F7F),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w100),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          onTap: (index) {
            homeController.changeIndex(index);
            if (index == 0) {
              Get.offAllNamed(AppRoutes.HOME);
            } else if (index == 1) {
              Get.toNamed(AppRoutes.NOTIFICATIONS);
            } else if (index == 2) {
              Get.toNamed(AppRoutes.PROFILE);
            }
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_none_outlined), label: 'notifications'.tr),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp), label: 'profile'.tr),
          ],
        ),
      ),


    );
  }
}