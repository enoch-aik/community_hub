import 'package:community_hub/core/validators/text_field_validators.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/src/res/assets/assets.dart';

@RoutePage(name: 'login')
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    ValueNotifier rememberMe = useState<bool>(false);

    return Scaffold(
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
            child: FilledButton(onPressed: () {}, child: const Text('Login')),
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
              ))
        ],
      ),
    );
  }
}
