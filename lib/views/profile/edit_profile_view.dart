import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile_controller.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';

class EditProfileView extends StatelessWidget {
  final ProfileController controller = Get.find();
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController dobController;
  final FocusNode nameFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode dobFocus = FocusNode();

  EditProfileView() {
    final user = controller.user.value!;
    nameController = TextEditingController(text: user.name);
    phoneController = TextEditingController(text: user.phone);
    emailController = TextEditingController(text: user.email);
    passwordController = TextEditingController(text: user.password);
    dobController = TextEditingController(text: user.dob);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('edit_profile'.tr), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              controller: nameController,
              focusNode: nameFocus,
              label: 'name'.tr,
              onSubmitted: (value) {
                if (value.isEmpty) {
                  Get.snackbar('خطأ', 'الاسم لا يمكن أن يكون فارغًا');
                  nameFocus.requestFocus();
                } else {
                  phoneFocus.requestFocus();
                }
              },
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: phoneController,
              focusNode: phoneFocus,
              label: 'phone'.tr,
              keyboardType: TextInputType.phone,
              onSubmitted: (value) {
                if (value.length < 10) {
                  Get.snackbar('خطأ', 'رقم الهاتف يجب أن يكون 10 أرقام');
                  phoneFocus.requestFocus();
                } else {
                  emailFocus.requestFocus();
                }
              },
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: emailController,
              focusNode: emailFocus,
              label: 'email'.tr,
              onSubmitted: (value) {
                if (!value.contains('@')) {
                  Get.snackbar('خطأ', 'البريد يجب أن يحتوي على @');
                  emailFocus.requestFocus();
                } else {
                  passwordFocus.requestFocus();
                }
              },
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              focusNode: passwordFocus,
              label: 'password'.tr,
              obscureText: true,
              onSubmitted: (value) {
                if (value.length < 6) {
                  Get.snackbar('خطأ', 'كلمة المرور يجب أن تكون 6 أحرف على الأقل');
                  passwordFocus.requestFocus();
                } else {
                  dobFocus.requestFocus();
                }
              },
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: dobController,
              focusNode: dobFocus,
              label: 'dob'.tr,
              onSubmitted: (value) {
                if (value.isEmpty) {
                  Get.snackbar('خطأ', 'تاريخ الميلاد لا يمكن أن يكون فارغًا');
                  dobFocus.requestFocus();
                } else {
                  updateProfile();
                }
              },
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'حفظ التغييرات',
              onPressed: updateProfile,
            ),
          ],
        ),
      ),
    );
  }

  void updateProfile() {
    if (nameController.text.isEmpty) {
      Get.snackbar('خطأ', 'الاسم لا يمكن أن يكون فارغًا');
      nameFocus.requestFocus();
    } else if (phoneController.text.length < 10) {
      Get.snackbar('خطأ', 'رقم الهاتف يجب أن يكون 10 أرقام');
      phoneFocus.requestFocus();
    } else if (!emailController.text.contains('@')) {
      Get.snackbar('خطأ', 'البريد يجب أن يحتوي على @');
      emailFocus.requestFocus();
    } else if (passwordController.text.length < 6) {
      Get.snackbar('خطأ', 'كلمة المرور يجب أن تكون 6 أحرف على الأقل');
      passwordFocus.requestFocus();
    } else if (dobController.text.isEmpty) {
      Get.snackbar('خطأ', 'تاريخ الميلاد لا يمكن أن يكون فارغًا');
      dobFocus.requestFocus();
    } else {
      controller.updateUser(
        nameController.text,
        phoneController.text,
        emailController.text,
        passwordController.text,
        dobController.text,
      );
    }
  }
}