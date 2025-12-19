import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/core/theme/app_buttoms.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/input_decoration_extensions.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  FocusNode _passFocusNode = FocusNode();

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
                    'Change Password',
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

          ValueListenableBuilder<bool>(
            valueListenable: _obscurePassword,
            builder: (context, obscure, _) {
              return TextFormField(
                controller: _passwordController,
                focusNode: _passFocusNode,
                obscureText: obscure,
                textInputAction: TextInputAction.done,
                style: TextStyle(color: AppColors.primaryBlack),
                decoration: context
                    .primaryInputDecoration
                    .copyWith(
                  hintText: "Current Password",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14, color: Colors.white
                    )
                ),
                // validator: Validators.password,
                autofillHints: const [AutofillHints.password],
              );
            },
          ),


          SizedBox(height: 16,),
          ValueListenableBuilder<bool>(
            valueListenable: _obscurePassword,
            builder: (context, obscure, _) {
              return TextFormField(
                controller: _passwordController,
                focusNode: _passFocusNode,
                obscureText: obscure,
                textInputAction: TextInputAction.done,
                style: TextStyle(color: AppColors.primaryBlack),
                decoration: context
                    .primaryInputDecoration
                    .copyWith(
                  hintText: "New Password",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14, color: Colors.white
                    )
                ),
                // validator: Validators.password,
                autofillHints: const [AutofillHints.password],
              );
            },
          ),

          SizedBox(height: 16,),

          ValueListenableBuilder<bool>(
            valueListenable: _obscurePassword,
            builder: (context, obscure, _) {
              return TextFormField(
                controller: _passwordController,
                focusNode: _passFocusNode,
                obscureText: obscure,
                textInputAction: TextInputAction.done,
                style: TextStyle(color: AppColors.primaryBlack),
                decoration: context
                    .primaryInputDecoration
                    .copyWith(
                  hintText: "Confirm New Password",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14, color: Colors.white
                  )
                ),
                // validator: Validators.password,
                autofillHints: const [AutofillHints.password],
              );
            },
          ),

          SizedBox(height: 16,),
          PrimaryButton(onPressed: (){}, height: 55, child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),))
        ],
      ),
    );
  }
}
