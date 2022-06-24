import 'package:flutter/material.dart';
import 'package:flutter_food_order/ui/pages/sign_up/sign_up_page.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
  }) : super(key: key);

  Widget _buildBackground(BuildContext context) =>
    Image.asset(
      Images.bgHome,
      height: context.height,
      width: context.width,
    );

  Widget _buildTextWidget(BuildContext context) =>
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 148.0,),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Welcome to\n',
                    ),
                    TextSpan(
                      text: 'AyoMaem',
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colors.primary,
                        fontSize: 42.0,
                      ),
                    ),
                  ],
                ),
                style: context.textTheme.labelLarge?.copyWith(
                  fontSize: 42.0,
                ),
              ),
              const SizedBox(height: 16.0,),
              Text(
                'Your favourite foods delivered fast at\nyour door.',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 18.0,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: context.colors.surface,
                    ),
                  ),
                  const SizedBox(width: 16.0,),
                  Text(
                    'sign in with',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.surface,
                    ),
                  ),
                  const SizedBox(width: 16.0,),
                  Expanded(
                    child: Divider(
                      color: context.colors.surface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0,),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                    onPressed: () {
                      context.pushAndReplace(builder: (ctx) => const SignUpPage());
                    },
                    color: Colors.transparent,
                    minWidth: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(
                        color: context.colors.surface,
                        width: 1.0,
                      ),
                    ),
                    child: Text(
                      'Start with email or phone',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.surface,
                      ),
                    ),
                ),
              ),
              const SizedBox(height: 16.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.surface,
                    ),
                  ),
                  const SizedBox(width: 32.0,),
                  InkWell(
                    onTap: () {
                      context.pushAndReplace(builder: (ctx) => const SignUpPage());
                    },
                    child: Text(
                      'Sign In',
                      style: context.textTheme.bodyMedium?.copyWith(
                        decoration: TextDecoration.underline,
                        color: context.colors.surface,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _gradientBgWidget(BuildContext context)
    => Container(
      height: context.height,
      width: context.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            ThemeColors.gradientColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(context),
          _gradientBgWidget(context),
          _buildTextWidget(context),
        ],
      ),
    );
  }
}