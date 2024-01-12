import 'package:codingtest/ui/screens/auth/auth_sheet.dart';
import 'package:codingtest/ui/widgets/app_buttons.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  showAuthSheet() {
    showModalBottomSheet(
        context: context,
        useSafeArea: true,
        enableDrag: true,
        builder: (_) {
          return const AuthSheet();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/breakfast.png'),
                      Text(
                        'Welcome',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 32,
                            ),
                      ),
                      Text(
                        'Before Enjoying Foodmedia Services, Please Register First',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              )),
              Column(
                children: [
                  AppButtons(action: showAuthSheet, label: 'Create Account'),
                  const SizedBox(
                    height: 16,
                  ),
                  AppButtons(
                    action: showAuthSheet,
                    label: 'Login',
                    isTonal: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'By Logging In Or Registering, You Have Agreed To ',
                      style: Theme.of(context).textTheme.labelLarge,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'The Terms And Conditions',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.green),
                        ),
                        const TextSpan(text: ' And'),
                        TextSpan(
                          text: ' Privacy Policy',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
