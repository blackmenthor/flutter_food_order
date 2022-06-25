import 'package:flutter/material.dart';
import 'package:flutter_food_order/core/models/auth_model.dart';
import 'package:flutter_food_order/ui/theme/colors.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';
import 'package:flutter_food_order/ui/utils/images.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late TextEditingController _emailCtrl;
  late TextEditingController _nameCtrl;

  @override
  void initState() {
    super.initState();

    _emailCtrl = TextEditingController();
    _nameCtrl = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final authModel = context.read<AuthModel>();
      final user = authModel.user;

      _emailCtrl.text = user?.email ?? '';
      _nameCtrl.text = user?.name ?? '';
    });
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    _nameCtrl.dispose();

    super.dispose();
  }

  Widget _backBtn(BuildContext context)
  => InkWell(
    onTap: () {
      context.pop();
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(8.0),
      child: const Icon(
        Icons.chevron_left,
        size: 24.0,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final authModel = context.watch<AuthModel>();
    final user = authModel.user;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: Image.asset(
                  Images.bgProfile,
                  width: double.infinity,
                ),
            ),
            Positioned(
              top: 8.0,
              left: 16.0,
              child: _backBtn(context),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 128.0,),
                  SizedBox(
                    height: 108,
                    width: 108,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(56.0),
                          child: Image.asset(
                            Images.icAngga,
                            height: 96.0,
                            width: 96.0,
                          ),
                        ),
                        Positioned(
                          bottom: 12.0,
                          right: 12.0,
                          child: InkWell(
                            onTap: () {
                              // TODO: ONTAP
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(6.0),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 16.0,
                                color: ThemeColors.greyColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                    const SizedBox(height: 16.0,),
                  Text(
                    user?.name ?? '-',
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 22.0,
                    ),
                  ),
                  const SizedBox(height: 8.0,),
                  Text(
                    'Edit Profile',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 16.0,
                      color: ThemeColors.greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _nameCtrl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: ThemeColors.textColor,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: context.colors.primary,
                          ),
                        ),
                        labelText: 'Full name',
                        hintText: 'Full name',
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _emailCtrl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: ThemeColors.textColor,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: context.colors.primary,
                          ),
                        ),
                        labelText: 'Email',
                        hintText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FloatingActionButton.extended(
          onPressed: () async {
            context.showLoadingDialog();
            final authModel = context.read<AuthModel>();

            try {
              await authModel.setUserProfile(
                name: _nameCtrl.text,
                email: _emailCtrl.text,
              );
              context.pop();
              context.showMessageSnackbar(text: 'Profile saved!');
            } catch (ex) {
              context.pop();
              context.showErrorSnackbar(text: ex.toString());
            }
          },
          backgroundColor: context.colors.primary,
          label: Text(
            'Save',
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
