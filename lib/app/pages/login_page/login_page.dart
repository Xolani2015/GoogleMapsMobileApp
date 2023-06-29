// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:Quickloc8app_attack_mobile_app/app/widgets/app_button.dart';
import 'package:Quickloc8app_attack_mobile_app/app/widgets/app_container.dart';
import 'package:Quickloc8app_attack_mobile_app/app/widgets/app_input_field.dart';
import 'package:Quickloc8app_attack_mobile_app/app/widgets/app_template.dart';
import 'package:Quickloc8app_attack_mobile_app/app/widgets/app_text.dart';
import 'package:Quickloc8app_attack_mobile_app/configurations/configurations.dart';
import 'package:Quickloc8app_attack_mobile_app/configurations/constants/app_image_assets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    return AppTemplate(
        pageBody: Column(
      children: [
        _headerWidget(mediaQueryHeight),
        SizedBox(
          height: mediaQueryHeight * 0.07,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: mediaQueryHeight * 0.04),
              color: Configuration().colors.primaryWhite,
              height: mediaQueryHeight * 0.58,
              child: Column(children: [
                AppTextField(
                  label: 'USERNAME',
                  controller: _usernameController,
                ),
                const SizedBox(height: 15),
                AppTextField(
                  label: 'PASSWORD',
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppText(
                          text: 'Forgot Password',
                          fontSize: Configuration().fontSizes.normalText3,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ))
                  ],
                ),
                SizedBox(
                  height: mediaQueryHeight * 0.03,
                ),
                Row(
                  children: [
                    Expanded(
                        child: AppButton(
                      text: 'Sign In',
                      height: mediaQueryHeight * 0.07,
                      textFontWeight: FontWeight.bold,
                      textColor: Configuration().colors.primaryWhite,
                      color: Configuration().colors.primaryBlack,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                    )),
                  ],
                ),
                SizedBox(
                  height: mediaQueryHeight * 0.05,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppContainer(
                        height: mediaQueryHeight * 0.07,
                        widget: Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(ImageAsset.googleImage),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Row(
                                      children: [
                                        AppText(
                                          text: 'Sign in with Google',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Expanded(child: Icon(Icons.arrow_forward))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: mediaQueryHeight * 0.04),
                Row(
                  children: [
                    Expanded(
                      child: AppContainer(
                        height: mediaQueryHeight * 0.07,
                        widget: Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage(ImageAsset.facebookImage),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Row(
                                      children: [
                                        AppText(
                                          text: 'Sign in with Facebook',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Expanded(child: Icon(Icons.arrow_forward))
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ]),
            ))
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              color: Configuration().colors.primaryColor,
              height: mediaQueryHeight * 0.05,
            ))
          ],
        ),
      ],
    ));
  }

  Row _headerWidget(double mediaQueryHeight) {
    return Row(
      children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Configuration().colors.primaryColor,
          height: mediaQueryHeight * 0.3,
          child: Column(
            children: [
              SizedBox(
                height: mediaQueryHeight * 0.07,
              ),

              SizedBox(
                height: mediaQueryHeight * 0.03,
              ),
              Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      AppText(
                        text: 'Sign In',
                        fontSize: Configuration().fontSizes.headerText,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ))
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}
