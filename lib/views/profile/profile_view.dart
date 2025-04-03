import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile_controller.dart';
import '../../routes/app_routes.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2A629A),
        title: Text('profile'.tr,style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back ,color: Colors.white,),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit,color:Colors.white ,),
            onPressed: () => Get.toNamed(AppRoutes.EDIT_PROFILE),
          ),
        ],
      ),
      body: Obx(
            () {
          final user = controller.user.value;
          if (user == null) return Center(child: Text('يرجى تسجيل الدخول'));
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileField('name'.tr, user.name),
                SizedBox(height: 16),
                _buildProfileField('phone'.tr, user.phone),
                SizedBox(height: 16),
                _buildProfileField('email'.tr, user.email),
                SizedBox(height: 16),
                _buildProfileField('dob'.tr, user.dob),
                SizedBox(height: 16),
                ListTile(
                  title: Text('password'.tr),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () => Get.defaultDialog(title: 'password'.tr, content: Text(user.password)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
        SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff2A629A)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(value, style: TextStyle(fontSize: 16,color: Color(0xff2A629A))),
        ),
      ],
    );
  }
}