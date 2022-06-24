import 'package:flutter/material.dart';
import 'package:flutter_food_order/ui/pages/sign_up/sign_up_page.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController _fullNameCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _phoneCtrl;
  late TextEditingController _passwordCtrl;

  var _passwordShown = false;

  @override
  void initState() {
    super.initState();

    _fullNameCtrl = TextEditingController();
    _emailCtrl = TextEditingController();
    _phoneCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passwordCtrl.dispose();

    super.dispose();
  }

  Widget _topBg(BuildContext context) =>
      Positioned(
        top: 0.0,
        child: Image.asset(
          Images.bgOrangeTop,
          width: context.width,
        ),
      );

  Widget _backBtn(BuildContext context)
      => Positioned(
        top: 16.0,
        left: 16.0,
        child: MaterialButton(
          color: context.colors.surface,
          minWidth: 0.0,
          padding: EdgeInsets.symmetric(
            horizontal: 4.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: const Icon(
            Icons.chevron_left,
            size: 32.0,
          ),
          onPressed: () {
            context.pushAndReplace(builder: (ctx) => const SignUpPage());
          },
        ),
      );

  Widget _textWidget(BuildContext context) =>
      Container(
        width: context.width,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 108.0,),
            Text(
              'Login',
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(height: 24.0,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(
                      color: ThemeColors.textColor,
                    )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: context.colors.primary,
                  ),
                ),
                labelText: 'Email',
                hintText: 'Email or phone',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(
                      color: ThemeColors.textColor,
                    )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: context.colors.primary,
                  ),
                ),
                labelText: 'Password',
                hintText: 'Password',
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _passwordShown = !_passwordShown;
                    });
                  },
                  child: Icon(
                    _passwordShown
                        ? Icons.remove_red_eye_rounded
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
              ),
              obscureText: !_passwordShown,
              keyboardType: TextInputType.text,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  color: context.colors.primary,
                  child: Text(
                    'Login',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.surface,
                    ),
                  ),
                  onPressed: () {

                  },
              ),
            ),
            const SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: context.textTheme.bodyMedium,
                ),
                const SizedBox(width: 32.0,),
                InkWell(
                  onTap: () {
                    context.pushAndReplace(builder: (ctx) => const SignUpPage());
                  },
                  child: Text(
                    'Sign Up',
                    style: context.textTheme.bodyMedium?.copyWith(
                      decoration: TextDecoration.underline,
                      color: context.colors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _topBg(context),
            _backBtn(context),
            _textWidget(context),
          ],
        ),
      ),
    );
  }
}
