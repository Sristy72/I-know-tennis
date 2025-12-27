import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:flutter_iknow_tennis/core/theme/app_buttoms.dart';
import 'package:flutx_core/core/validation/validators.dart';
import 'package:get/get.dart';

import '../../../core/theme/input_decoration_extensions.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();


  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      'Privacy policy',
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
            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, '
                'when an unknown printer took a galley of type and '
                'scrambled it to make a type specimen book.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
        
            SizedBox(
              height: 40,
            ),
        
            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, '
                'when an unknown printer took a galley of type and '
                'scrambled it to make a type specimen book.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
        
            SizedBox(
              height: 40,
            ),
            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, '
                'when an unknown printer took a galley of type and '
                'scrambled it to make a type specimen book.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
        
            SizedBox(
              height: 40,
            ),
            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, '
                'when an unknown printer took a galley of type and '
                'scrambled it to make a type specimen book.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
        
            SizedBox(
              height: 40,
            ),
            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, '
                'when an unknown printer took a galley of type and '
                'scrambled it to make a type specimen book.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
