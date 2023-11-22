import 'dart:io';

import 'package:community_hub/app/auth/data/models/new_client.dart';
import 'package:community_hub/app/auth/domain/params/user_credentials.dart';
import 'package:community_hub/app/auth/presentation/ui/modals/choose_user_type.dart';
import 'package:community_hub/app/auth/providers.dart';
import 'package:community_hub/core/dependency_injection/di_providers.dart';
import 'package:community_hub/core/service_exceptions/service_exception.dart';
import 'package:community_hub/core/validators/text_field_validators.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/src/res/assets/assets.dart';
import 'package:community_hub/src/router/navigator.dart';
import 'package:community_hub/src/router/router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';

@RoutePage(name: 'login')
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    ValueNotifier rememberMe = useState<bool>(false);

    // auth provider
    final auth = ref.read(authRepoProvider);

    //formKey
    final GlobalKey<FormState> formKey = GlobalKey();
    return Form(
      key: formKey,
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80.h, bottom: 32.h),
              child: SvgPicture.asset(
                AppAssets.logoSvg,
                color: context.primary,
              ),
            ),
            KText(
              'Login',
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: DefaultTextFormField(
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
                  }),
            ),
            PasswordTextField(
              label: 'Password',
              controller: passwordController,
              emptyTextError: 'Password is required',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: Checkbox(
                          value: rememberMe.value,
                          onChanged: (value) {
                            rememberMe.value = value!;
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: KText(
                        'Remember Me',
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ColSpacing(24.h),
            SizedBox(
              width: double.maxFinite,
              child: FilledButton(
                  onPressed: () async {
                    //if form is valid, try to login
                    if (formKey.currentState!.validate()) {
                      Loader.show(context);
                      UserCred user = UserCred(
                          email: emailController.text.trim(),
                          password: passwordController.text);
                      final result = await auth.clientLogin(user);
                      Loader.hide(context);
                      result.when(success: (data) {
                        AppNavigator.of(context).replaceAll([const Home()]);
                        //if the login was successful, navigate to home screen
                      }, apiFailure: (e, _) {
                        showMessageAlertDialog(context, text: e.message);
                      });
                    }
                  },
                  child: const Text('Login')),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                children: [
                  const Expanded(child: Divider()),
                  KText(
                    '  Or Login with  ',
                    fontSize: 15.sp,
                  ),
                  const Expanded(child: Divider())
                ],
              ),
            ),
            OutlinedButton(
                onPressed: () async {
                  Loader.show(context);
                  final result = await auth.googleSignIn();
                  Loader.hide(context);
                  result.when(success: (data) async {
                    //check if user exist in db, if not, save user details to db
                    final firebaseApi = ref.read(firebaseApiProvider);
                    bool exists =
                        await firebaseApi.getClient(data.user?.email ?? '');
                    String? fcmToken = '';
                    if (Platform.isAndroid) {
                      fcmToken = await FirebaseMessaging.instance.getToken();
                    }
                    if (!exists) {
                      final user = NewClient(
                          fullName: data.user?.displayName ?? '',
                          emailAddress: data.user?.email ?? '',
                          password: '',
                          fcmToken: fcmToken,
                          userId: data.user?.uid ?? '');
                      await firebaseApi.storeClientData(
                          newUser: user, credential: data);
                    } else {
                      showMessageAlertDialog(context,
                          text: 'User already exists');
                    }
                    AppNavigator.of(context).replaceAll([const Home()]);
                  }, apiFailure: (e, _) {
                    showMessageAlertDialog(context, text: e.message);
                  });

                  //AppNavigator.of(context).replace(const Home());
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SvgPicture.asset(AppAssets.googleSvg),
                    ),
                    const Text('Login with Google'),
                  ],
                )),
            ColSpacing(16.h),
            GestureDetector(
              onTap: () {
                //show bottomSheet to ask if user wants to signup for client or worker
                ChooseAccountType.displayModal(context);
              },
              child: Text.rich(
                TextSpan(children: [
                  const TextSpan(text: 'Don\'t have an account?  '),
                  TextSpan(
                      text: 'Signup',
                      style: const TextStyle()
                          .copyWith(fontWeight: FontWeight.w500))
                ]),
                textAlign: TextAlign.center,
                style: TextStyle().copyWith(fontSize: 15.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
