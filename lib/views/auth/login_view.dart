import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';
import '../../routes/app_routes.dart';

class LoginView extends StatelessWidget {
  final AuthController controller = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  final RxBool obscurePassword = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 50),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/logo.jpeg'),
            ),
            SizedBox(height: 20),
            Obx(
                  () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: emailController,
                    focusNode: emailFocus,
                    label: 'email'.tr,
                    onChanged: (value) {
                      if (value.isEmpty || !value.contains('@') || !value.contains('.')) {
                        emailError.value = 'البريد يجب أن يحتوي على @ و .';
                      } else {
                        emailError.value = '';
                      }
                    },
                    onSubmitted: (_) => passwordFocus.requestFocus(),
                  ),
                  if (emailError.value.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(emailError.value, style: TextStyle(color: Colors.red, fontSize: 12)),
                    ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Obx(
                  () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: passwordController,
                    focusNode: passwordFocus,
                    label: 'password'.tr,
                    obscureText: obscurePassword.value,
                    onChanged: (value) {
                      if (value.length < 6) {
                        passwordError.value = 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                      } else {
                        passwordError.value = '';
                      }
                    },
                    suffixIcon: IconButton(
                      icon: Icon(obscurePassword.value ? Icons.visibility : Icons.visibility_off),
                      onPressed: () => obscurePassword.value = !obscurePassword.value,
                    ),
                  ),
                  if (passwordError.value.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(passwordError.value, style: TextStyle(color: Colors.red, fontSize: 12)),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'login'.tr,
              onPressed: () {
                if (emailError.value.isEmpty &&
                    passwordError.value.isEmpty &&
                    emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  controller.login(emailController.text, passwordController.text);
                }
              },
            ),
            TextButton(
              onPressed: () => Get.toNamed(AppRoutes.SIGNUP),
              child: Text('ليس لديك حساب؟ إنشاء حساب'),
            ),
          ],
        ),
      ),
    );
  }
}