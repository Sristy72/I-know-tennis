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
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                    ),
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
            SizedBox(height: 16),
            Text(
              'Welcome to iKnowTennis (the “App”). These Terms and Conditions (“Terms”) govern your access to and use of the App, website, and any related services (collectively, the “Service”) provided by [Your Company Name or Your Name] (“we,” “us,” or “our”).By downloading, installing, accessing, or using the Service, you agree to be bound by these Terms. If you do not agree, do not use the Service.\n\n'
              '1. Eligibility\n'
              '\t\tYou must be at least 16 years old (or the minimum age required in your country to use online services without parental consent) to use the Service.\n'
              '\t\tIf you are under 18 (or the age of majority in your jurisdiction), you may only use the Service under the supervision of a parent or legal guardian who agrees to these Terms.\n\n'
              '2. License to Use the Service\n'
              'We grant you a limited, non-exclusive, non-transferable, revocable license to use the Service for your personal, non-commercial use, subject to these Terms.\n'
              'You may not:\n'
              '\t\tCopy, modify, distribute, sell, or lease any part of the Service;\n'
              '\t\tReverse engineer, decompile, or attempt to extract the source code;\n'
              '\t\tUse the Service in any unlawful manner or in violation of any third-party rights.\n\n'
              '3. User Accounts\n'
              '\tYou may need to create an account to access certain features.'
              '\tYou are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.\n'
              '\tYou agree to notify us immediately of any unauthorized use of your account.\n'
              '\tWe reserve the right to suspend or terminate accounts that violate these Terms or engage in abusive behavior.\n\n'
              '4. User Content\n'
              'By submitting User Content, you grant us a worldwide, royalty-free, perpetual, irrevocable, transferable license to use, modify, distribute, display, and create derivative works of your User Content in connection with operating and improving the Service.\n'
              'You represent and warrant that:\n'
              '\tYou own or have the necessary rights to your User Content;\n'
              '\tYour User Content does not violate any third-party rights (including copyright, trademark, privacy, or publicity rights);\n'
              '\tYour User Content is not defamatory, obscene, hateful, or illegal.\n'
              'We may, but are not obligated to, monitor, review, or remove User Content at our sole discretion, especially if it violates these Terms.\n\n'
              '5. Prohibited Conduct\n'
              'You agree not to:\n'
              '\tHarass, threaten, or bully other users;\n'
              '\tPost or share inappropriate, offensive, hateful, pornographic, or illegal content;\n'
              '\tCheat, use bots, hacks, or unauthorized third-party software;\n'
              '\tSpam, advertise, or promote products/services without our permission;\n'
              '\tImpersonate others or provide false information;\n'
              '\tInterfere with the operation of the Service (e.g., DDoS attacks, viruses);\n'
              '\tAttempt to gain unauthorized access to the Service or other users’ accounts.\n\n'

              '6. Intellectual Property\n'
              'All content in the Service (excluding User Content) including text, graphics, logos, quizzes created by us, software, and trademarks is owned by us or our licensors and protected by copyright, trademark, and other laws.\n'
              'You may not use our trademarks or branding without prior written permission.\n\n'

              '7. Advertising and Third-Party Content\n'
              'The Service is ad-supported. We may display advertisements and promotions from third parties. Your interactions with advertisers are solely between you and them.\n'
              'The Service may contain links to third-party websites or services. '
                  'We are not responsible for the content, accuracy, or practices of such third parties.\n\n'

              '8. Disclaimer of Warranties\n'
              'THE SERVICE IS PROVIDED “AS IS” AND “AS AVAILABLE” WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, '
                  'INCLUDING BUT NOT LIMITED TO IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT.\n'
              'WE DO NOT GUARANTEE THAT THE SERVICE WILL BE UNINTERRUPTED, ERROR-FREE, SECURE, OR FREE OF VIRUSES.\n\n'

              '9. Limitation of Liability\n'
              'TO THE MAXIMUM EXTENT PERMITTED BY LAW, WE SHALL NOT BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES, OR ANY LOSS OF PROFITS OR DATA, ARISING OUT OF YOUR USE OF THE SERVICE — EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.\n'
              'OUR TOTAL LIABILITY TO YOU FOR ANY CLAIMS ARISING FROM THESE TERMS OR THE SERVICE SHALL NOT EXCEED THE AMOUNT YOU PAID US IN THE PAST 12 MONTHS (OR \$5 USD IF YOU HAVE PAID NOTHING).\n'
              'Some jurisdictions do not allow the exclusion or limitation of certain damages, so the above limitations may not apply to you.\n\n'

              '10. Termination\n'
              'We may suspend or terminate your access to the Service at any time, with or without cause or notice, including if you violate these Terms.\n'
              'Upon termination, your license to use the Service ends, and you must cease all use.\n\n'

              '11. Governing Law and Dispute Resolution\n'
              'These Terms are governed by the laws of [Your Country/State, e.g., the State of California, United States], without regard to conflict of law principles.\n'
              'Any disputes arising from these Terms or the Service shall be resolved in the courts located in [Your City/County, e.g., '
                  'San Francisco County, California].\n\n'

              '12. Changes to These Terms\n'
              'We may update these Terms from time to time. We will notify you of material changes by posting the new Terms in the App and '
                  'updating the “Last Updated” date. Your continued use of the Service after changes constitutes acceptance of the updated Terms.\n\n'
              '13. Miscellaneous\n'
              '\tThese Terms constitute the entire agreement between you and us regarding the Service.\n'
              '\tIf any provision is found unenforceable, the remaining provisions remain in effect.\n'
              '\tOur failure to enforce any right does not constitute a waiver.\n'
              '\tYou may not assign your rights under these Terms without our written consent.\n\n'

              '14. Contact Us\n'
              'If you have any questions about these Terms, please contact us at info@iKnowTennis.com\n'
              'Note: Replace all placeholders (app name, company name, contact email, jurisdiction, etc.) '
                  'with your actual information. For apps distributed globally or in regions like the EU, California (CCPA), or others with specific legal requirements, consult a qualified attorney to ensure full compliance with local laws. This is a general template and not legal advice.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),

            // SizedBox(
            //   height: 40,
            // ),
            //
            // Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
            //     'standard dummy text ever since the 1500s, '
            //     'when an unknown printer took a galley of type and '
            //     'scrambled it to make a type specimen book.',
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
            //
            // SizedBox(
            //   height: 40,
            // ),
            // Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
            //     'standard dummy text ever since the 1500s, '
            //     'when an unknown printer took a galley of type and '
            //     'scrambled it to make a type specimen book.',
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
            //
            // SizedBox(
            //   height: 40,
            // ),
            // Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
            //     'standard dummy text ever since the 1500s, '
            //     'when an unknown printer took a galley of type and '
            //     'scrambled it to make a type specimen book.',
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
            //
            // SizedBox(
            //   height: 40,
            // ),
            // Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
            //     'standard dummy text ever since the 1500s, '
            //     'when an unknown printer took a galley of type and '
            //     'scrambled it to make a type specimen book.',
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
