import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';
import '../../routes/app_routes.dart';

class SignupView extends StatelessWidget {
  final AuthController controller = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode dobFocus = FocusNode();
  final RxString nameError = ''.obs;
  final RxString phoneError = ''.obs;
  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  final RxString dobError = ''.obs;
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
            Text('signup'.tr, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color(0xff2A629A))),
            SizedBox(height: 20),
            Obx(
                  () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: nameController,
                    focusNode: nameFocus,
                    label: 'name'.tr,
                    onChanged: (value) {
                      if (value.length < 3) {
                        nameError.value = 'الاسم يجب أن يكون 3 أحرف على الأقل';
                      } else {
                        nameError.value = '';
                      }
                    },
                    onSubmitted: (_) => phoneFocus.requestFocus(),
                  ),
                  if (nameError.value.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(nameError.value, style: TextStyle(color: Colors.red, fontSize: 12)),
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
                    controller: phoneController,
                    focusNode: phoneFocus,
                    label: 'phone'.tr,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      if (value.length != 10) {
                        phoneError.value = 'رقم الهاتف يجب أن يكون 10 أرقام';
                      } else {
                        phoneError.value = '';
                      }
                    },
                    onSubmitted: (_) => emailFocus.requestFocus(),
                  ),
                  if (phoneError.value.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(phoneError.value, style: TextStyle(color: Colors.red, fontSize: 12)),
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
                      if (value.length < 5) {
                        passwordError.value = 'كلمة المرور يجب أن تكون5 أحرف على الأقل';
                      } else {
                        passwordError.value = '';
                      }
                    },
                    suffixIcon: IconButton(
                      icon: Icon(obscurePassword.value ? Icons.visibility_off : Icons.visibility),
                      onPressed: () => obscurePassword.value = !obscurePassword.value,
                    ),
                    onSubmitted: (_) => dobFocus.requestFocus(),
                  ),
                  if (passwordError.value.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(passwordError.value, style: TextStyle(color: Colors.red, fontSize: 12)),
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
                    controller: dobController,
                    focusNode: dobFocus,
                    label: 'dob'.tr,
                    onChanged: (value) {
                      if (value.isEmpty || !RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(value)) {
                        dobError.value = 'تاريخ الميلاد يجب أن يكون بصيغة dd/mm/yyyy';
                      } else {
                        dobError.value = '';
                      }
                    },
                    onSubmitted: (_) => signup(),
                  ),
                  if (dobError.value.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(dobError.value, style: TextStyle(color: Colors.red, fontSize: 12)),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'signup'.tr,
              onPressed: signup,
            ),
            SizedBox(height: 60,),
            TextButton(
              onPressed: () => Get.toNamed(AppRoutes.LOGIN),
              style: TextButton.styleFrom(
                foregroundColor: Color(0xff2A629A),),
              child: Text('لديك حساب؟ تسجيل الدخول'),
            ),
          ],
        ),
      ),
    );
  }

  void signup() {
    if (nameError.value.isEmpty &&
        phoneError.value.isEmpty &&
        emailError.value.isEmpty &&
        passwordError.value.isEmpty &&
        dobError.value.isEmpty &&
        nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        dobController.text.isNotEmpty) {
      controller.signup(
        nameController.text,
        phoneController.text,
        emailController.text,
        passwordController.text,
        dobController.text,
      );
    }
  }
}