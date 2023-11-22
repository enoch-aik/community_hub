import 'dart:io';

import 'package:community_hub/app/auth/data/models/new_client.dart';
import 'package:community_hub/app/auth/providers.dart';
import 'package:community_hub/core/dependency_injection/di_providers.dart';
import 'package:community_hub/core/service_exceptions/src/api_exceptions.dart';
import 'package:community_hub/core/validators/text_field_validators.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/src/router/navigator.dart';
import 'package:community_hub/src/router/router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

@RoutePage(name: 'clientSignup')
class ClientSignupScreen extends HookConsumerWidget {
  const ClientSignupScreen({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final fullNameController = useTextEditingController();
    final passwordController = useTextEditingController();
    AutovalidateMode validateMode = AutovalidateMode.onUserInteraction;
    final auth = ref.read(authRepoProvider);
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            ColSpacing(16.h),
            KText(
              'Welcome!👋',
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: context.primary,
            ),
            ColSpacing(4.h),
            KText(
              'Please fill in the details below to create your account',
              fontSize: 16.sp,
            ),
            SizedBox(
              height: 32.h,
            ),

            DefaultTextFormField(
              label: 'Full name',
              hint: 'Type your full name here',
              controller: fullNameController,
              emptyTextError: 'Full name is required',
              keyboardType: TextInputType.name,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Full Name is required';
                } else if (value.isNotEmpty &&
                    !TextFieldValidator.nameExp.hasMatch(value)) {
                  return 'Full Name is not valid';
                }
                return null;
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            //email textField
            DefaultTextFormField(
              label: 'Email address',
              hint: 'user@example.com',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Email address is required';
                } else if (value.isNotEmpty &&
                    !TextFieldValidator.emailExp.hasMatch(value)) {
                  return 'Email address not valid';
                }
                return null;
              },
            ),
            //password textField
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: PasswordTextField(
                  label: 'Password',
                  controller: passwordController,
                  emptyTextError: 'Password is required',
                  isSignUp: true),
            ),
            SizedBox(
              height: 40.h,
            ),
            FilledButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {

                    Loader.show(context);
                    String? fcmToken = '';
                    if (Platform.isAndroid) {
                      fcmToken = await FirebaseMessaging.instance.getToken();
                    }
                    NewClient user = NewClient(
                        fullName: fullNameController.text.trim(),
                        emailAddress: emailController.text,
                        fcmToken: fcmToken,
                        password: passwordController.text);
                    final result = await auth.signUpWithEmailAndPassword(user);

                    result.when(success: (data) async {
                      final firebaseDb = ref.read(firebaseApiProvider);
                      bool stored = await firebaseDb.storeClientData(
                          newUser: user, credential: data);

                      Loader.hide(context);
                      AppNavigator.of(context).replaceAll([const Home()]);
                    }, apiFailure: (e, _) {
                      Loader.hide(context);
                      showMessageAlertDialog(context, text: e.message);
                    });
                  }
                },
                child: const Text('Create Account'))
          ],
        ),
      ),
    );
  }
}
