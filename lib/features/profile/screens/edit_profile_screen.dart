import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/core/theme/app_buttoms.dart';
import 'package:flutx_core/core/validation/validators.dart';
import 'package:get/get.dart';

import '../../../core/theme/input_decoration_extensions.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();


  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          SizedBox(height: 76),
          SizedBox(
            height: 40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white,)),
                ),
                Center(
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16,),
          // Profile Picture with Edit Button
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/Container.png'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3377FF),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 20,  // Adjust this to change the image size
                      width: 20,   // Keep it square for best appearance
                      child: Image.asset(
                        'assets/images/image.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16,),

          TextFormField(
            controller: _nameController,
            focusNode: _nameFocus,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: Colors.white,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
            decoration: context.primaryInputDecoration.copyWith(
              hintText: "Name",
            ),
            validator: Validators.email,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(_nameFocus),
            autofillHints: const [AutofillHints.email],
          ),

          SizedBox(height: 16,),
          
          PrimaryButton(onPressed: (){}, height: 55, child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),))
        ],
      ),
    );
  }
}
