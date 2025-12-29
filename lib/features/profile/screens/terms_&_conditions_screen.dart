import 'package:flutter/material.dart';
import 'package:flutter_iknow_tennis/core/common/widgets/app_scaffold.dart';
import 'package:get/get.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {


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
                      'Terms & Conditions',
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
