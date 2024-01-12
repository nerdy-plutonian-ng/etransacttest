import 'package:codingtest/ui/widgets/app_buttons.dart';
import 'package:flutter/material.dart';

import '../../../utils/helper_functions.dart';
import '../../../utils/local_data.dart';
import '../../widgets/app_textbox.dart';

class AuthSheet extends StatefulWidget {
  const AuthSheet({super.key, this.tabIndex = 0});

  final int tabIndex;

  @override
  State<AuthSheet> createState() => _AuthSheetState();
}

class _AuthSheetState extends State<AuthSheet> {
  late final PageController controller;
  late int tabIndex;
  late final Map<String, Map<String, String>> _authFields;
  final key = GlobalKey<FormState>();

  setTabIndex(int index) {
    setState(() {
      tabIndex - index;
    });
  }

  loginOrRegister(){
    if(key.currentState?.validate() ?? false){
      print(_authFields);
    }
  }

  @override
  void initState() {
    super.initState();
    tabIndex = widget.tabIndex;
    controller = PageController(initialPage: tabIndex);
    _authFields = authFields;
    if (tabIndex == 1) {
      _authFields.remove('Full Name');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  onChange(String key,String secondKey, String value){
    _authFields[key]![secondKey] = value;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: tabIndex == 1 ? Colors.grey : null),
                  onPressed: () {
                    setState(() {
                      tabIndex = 0;
                      _authFields.addAll({
                        'Full Name': {'placeholder': '', 'value': ''}
                      });
                    });
                  },
                  child: const Text('Create Account')),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: tabIndex == 0 ? Colors.grey : null),
                  onPressed: () {
                    setState(() {
                      tabIndex = 1;
                      _authFields.remove('Full Name');
                    });
                  },
                  child: const Text('Login')),
            ],
          ),
          for (var i = 0; i < authFields.length; i++)
            AppTextBox(
              onChange : onChange,
              validator: emptyValidator,
              label: _authFields.keys.toList()[i],
              placeholder:
                  (_authFields[_authFields.keys.toList()[i]])!['placeholder']!,
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppButtons(
                action: loginOrRegister, label: tabIndex == 0 ? 'Register' : 'Login'),
          )
        ],
      ),
    );
  }
}
