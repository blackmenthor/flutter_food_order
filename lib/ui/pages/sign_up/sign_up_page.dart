import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_food_order/core/models/auth_models.dart';
import 'package:flutter_food_order/ui/pages/home/home_page.dart';
import 'package:flutter_food_order/ui/pages/login/login_page.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  late TextEditingController _fullNameCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _passwordCtrl;

  var _passwordShown = false;

  @override
  void initState() {
    super.initState();

    _fullNameCtrl = TextEditingController();
    _emailCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _emailCtrl.dispose();
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
              'Sign Up',
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(height: 24.0,),
            TextField(
              controller: _fullNameCtrl,
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
                labelText: 'Full name',
                hintText: 'Full name',
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16.0,),
            TextField(
              controller: _emailCtrl,
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
                hintText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0,),
            TextField(
              controller: _passwordCtrl,
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
                    'Sign Up',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.surface,
                    ),
                  ),
                  onPressed: () {
                    _register(context);
                  },
              ),
            ),
            const SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: context.textTheme.bodyMedium,
                ),
                const SizedBox(width: 32.0,),
                InkWell(
                  onTap: () {
                    context.pushAndReplace(builder: (ctx) => const LoginPage());
                  },
                  child: Text(
                    'Sign In',
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

  Future<void> _register(BuildContext context) async {
    final email = _emailCtrl.text;
    final name = _fullNameCtrl.text;
    final password = _passwordCtrl.text;
    final authModel = context.read<AuthModel>();

    if (email.isEmpty || name.isEmpty || password.isEmpty) {
      context.showErrorSnackbar(text: 'You need to complete all fields!');
      return;
    }

    try {
      context.showLoadingDialog();
      await authModel.register(
          email: email,
          name: name,
          password: password,
      );
      context.pushAndReplace(builder: (ctx) => HomePage());
      context.showMessageSnackbar(
          text: 'Registration successful!',
      );
    } catch (ex) {
      context.pop();
      context.showErrorSnackbar(text: ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _topBg(context),
            _textWidget(context),
          ],
        ),
      ),
    );
  }
}
